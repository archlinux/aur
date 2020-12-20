# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('Apache')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://packages.timber.io/vector/0.11.1/vector-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('c04a1a1c954dd00b5cf09788968b5b8465f1c6326b61934727cf713155b00c5d')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et:

# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('MPL')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://packages.timber.io/vector/${pkgver}/vector-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('46129c085b6ea8807ab9063277ed96a51ae84e59a6fe66a0fd1fb1e29c278a9d')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et:

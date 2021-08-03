# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('MPL')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://packages.timber.io/vector/${pkgver}/vector-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('16c9aa0b9cf2c3df3cfcd745e69d0b9ca094fde28ea2597d6f49b6423397574a')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et:

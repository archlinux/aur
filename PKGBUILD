# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.19.0
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('MPL')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://packages.timber.io/vector/${pkgver}/vector-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('60f4afce8bafba97ab971ba7cacc88f7c9617865d30a201dc6dcbbf3c41ee0e7')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et:

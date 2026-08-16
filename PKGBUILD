# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=bt-volume-step
pkgver=1.0.0
pkgrel=1
pkgdesc="Fixed volume steps for Bluetooth audio devices on PipeWire"
arch=('any')
url="https://github.com/Felitendo/bt-volume-step"
license=('BSD-3-Clause')
depends=('python' 'libpulse')
optdepends=('kconfig: follow the KDE Plasma volume step setting'
            'bluez-utils: device names in --show')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b06ba55c3764271856a5a806c28dc71b0802f85fd3d706699834eb4249ed097')

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

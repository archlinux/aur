# Maintainer: GI Jack <youremail@domain.com>

pkgname=siglo
pkgver=0.6.0
pkgrel=1
pkgdesc="GTK app to sync InfiniTime watch with PinePhone"
arch=('any')
url="https://github.com/alexr4535/siglo"
license=('GPL')
# missing python-gatt
depends=('python' 'dbus-python' 'bluez' 'bluez-utils')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexr4535/siglo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1821a27353a91bc886ae85ae32affdd9709236e5d4da0ee411842bff7f35346f')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  arch-meson build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

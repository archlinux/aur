# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=siglo
pkgver=0.9.4
pkgrel=1
pkgdesc="GTK app to sync InfiniTime(PineTime) watch"
arch=('any')
url="https://github.com/alexr4535/siglo"
license=('GPL')
depends=('python' 'dbus-python' 'python-pyxdg' 'python-gatt' 'bluez' 'bluez-utils')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexr4535/siglo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b02cd6002d52522d9391bf4d7902ca89c9ad4c612556c9872773da1f2ecbd0a5')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  arch-meson build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

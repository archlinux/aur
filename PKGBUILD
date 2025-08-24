# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=siglo
pkgver=0.9.9
pkgrel=2
pkgdesc="GTK app to sync InfiniTime(PineTime) watch"
arch=('any')
url="https://github.com/alexr4535/siglo"
license=('GPL')
depends=('python' 'dbus-python' 'python-pyxdg' 'python-gatt' 'bluez' 'bluez-utils' 'python-requests')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexr4535/siglo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20ebd34c2a7f58733a7ed0d729b01108feb4d1ee4e61a070631402b7236d4121')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  arch-meson build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

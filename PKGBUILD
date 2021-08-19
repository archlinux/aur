# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=siglo
pkgver=0.8.14
pkgrel=1
pkgdesc="GTK app to sync InfiniTime(PineTime) watch"
arch=('any')
url="https://github.com/alexr4535/siglo"
license=('GPL')
depends=('python' 'dbus-python' 'python-pyxdg' 'python-gatt' 'bluez' 'bluez-utils')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexr4535/siglo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ffbb5f593164c610405b5b40e2d87745703afe79969875a3bcb510f6b834e5e8')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  arch-meson build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

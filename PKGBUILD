# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=siglo
pkgver=0.9.6
pkgrel=1
pkgdesc="GTK app to sync InfiniTime(PineTime) watch"
arch=('any')
url="https://github.com/alexr4535/siglo"
license=('GPL')
depends=('python' 'dbus-python' 'python-pyxdg' 'python-gatt' 'bluez' 'bluez-utils')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexr4535/siglo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88dec8c6d861a1e5a547b1ea2e6133d54395eb0478977df395cb2eb3f50197c1')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  arch-meson build
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}

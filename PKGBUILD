_pkgname=eph-epm
pkgname=ephepm-iaarasru
pkgver=2.0
pkgrel=1
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL3')
arch=('x86_64')
depends=('gtk4')
makedepends=('meson' 'ninja' 'mathgl' 'gtkmm-4.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProfessorNavigator/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('28491a75bfef0077aa2ea62883c16d899e841c4b0a2fb33b313f34b9be88b792')

build() {
  arch-meson ${_pkgname}-${pkgver} build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


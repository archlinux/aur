_pkgname=eph-epm
pkgname=ephepm-iaarasru
pkgver=1.1
pkgrel=1
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL3')
arch=('x86_64')
depends=('gtk4')
makedepends=('meson' 'ninja' 'mathgl' 'gtkmm-4.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProfessorNavigator/eph-epm/archive/refs/tags/v1.1.tar.gz")
sha256sums=('d8ec64110cb9e6cb91f8552bc75c98713dac3d9255c41ebf31b49fd3817fac90')

build() {
  arch-meson ${_pkgname}-${pkgver} build
  ninja -C build
}


package() {
  DESTDIR="$pkgdir" meson install -C build
}


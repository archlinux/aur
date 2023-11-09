# Maintainer: gee
pkgname='gitklient'
pkgver=0.3
pkgrel=2
pkgdesc='Git gui client for KDE'
arch=('x86_64')
url='https://github.com/HamedMasafi/GitKlient'
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules')
depends=('qt5-base' 'ktexteditor5' 'kdoctools5')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8798a3c452652d12b66fe4f1053cfcfd65a6d2a79f01fe65095e42d5b7ef9b2')

build() {
  rm build -rf
  mkdir build
  cd build
  cmake ../GitKlient-${pkgver}
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

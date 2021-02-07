# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=qcheckgmail
_pkgname=qCheckGMail
pkgver=1.3.0
pkgrel=1
pkgdesc="Qt/C++ multiple gmail account checker"
arch=("i686" "x86_64")
url="http://mhogomchungu.github.io/qCheckGMail/"
license=("GPL")
depends=("kwallet" "plasma-workspace")
makedepends=("cmake" "extra-cmake-modules")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mhogomchungu/qCheckGMail/archive/${pkgver}.tar.gz")
md5sums=('2026e3b5b590f217c36ab9b6fc8bac1d')

prepare() {
  bsdtar -xf ${_pkgname}-${pkgver}.tar.gz
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
  -DKF5=true \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}

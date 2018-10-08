# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=qcheckgmail
_pkgname=qCheckGMail
pkgver=1.2.9
pkgrel=1
pkgdesc="Qt/C++ multiple gmail account checker"
arch=("i686" "x86_64")
url="http://mhogomchungu.github.io/qCheckGMail/"
license=("GPL")
depends=("kwallet" "plasma-workspace")
makedepends=("cmake" "extra-cmake-modules")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/mhogomchungu/qCheckGMail/archive/${pkgver}.tar.gz")
md5sums=('cafd6331c72853ea9cba3d49945f6def')

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

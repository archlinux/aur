# Maintainer: Martchus <martchus@gmx.net>
_reponame=cpp-utilities
pkgname=c++utilities
pkgver=3.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Common C++ classes and routines used by my applications such as argument parser, IO and conversion utilities."
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('6a97975bd5614493cec700b9d5733a4dd78cbc361e05848b302f79ac6142915d')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}

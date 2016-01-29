# Maintainer: Martchus <martchus@gmx.net>
_reponame=cpp-utilities
pkgname=c++utilities
pkgver=3.1.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Common C++ classes and routines used by my applications such as argument parser, IO and conversion utilities."
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('6d94b823b9ec8e645e79f6bcdfed65bc2c8d3e3ac748f5ce969af1680cee9274')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make install
}

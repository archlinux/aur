# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Marco Pompili <marcs.pompili@gmail.com>

pkgname=oglplus
pkgver=0.66
pkgrel=1
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('any')
url="http://oglplus.org/"
license=('Boost')
depends=('freeglut' 'glew')
makedepends=('freeglut' 'glew' 'cmake')
optdepends=('boost')
provides=('oglplus')
source=("http://downloads.sourceforge.net/project/oglplus/oglplus-${pkgver}.x/oglplus-${pkgver}.0.tar.gz")
md5sums=('5e389643e63979cb6ab3918cf8d88b27')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.0"

  ./configure.sh --prefix /usr --no-examples --no-docs

  cd _build

  make -j 3
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}.0/_build"
  make DESTDIR="$pkgdir/" install
}

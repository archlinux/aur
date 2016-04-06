# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.68
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
md5sums=('6dcd74cb4de855ccc3e8ce06715291e6')

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

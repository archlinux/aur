pkgname=phototonic
pkgver=1.6.17
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/c3737334746d0bae2369b23d982ade5a981dcdd7.tar.gz")
md5sums=('e29e7dc3a0f5ee08b084c68501140d45')

build() {
  cd "$srcdir/$pkgname-c3737334746d0bae2369b23d982ade5a981dcdd7"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-c3737334746d0bae2369b23d982ade5a981dcdd7"
  make INSTALL_ROOT="$pkgdir/" install
}

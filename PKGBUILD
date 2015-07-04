pkgname=phototonic
pkgver=1.6.6
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/c9427078ea5335a76e006c1924f50fbd2ef458a5.tar.gz")
md5sums=('57d22dbbb49d0e7953715ba80be377e0')

build() {
  cd "$srcdir/$pkgname-c9427078ea5335a76e006c1924f50fbd2ef458a5"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-c9427078ea5335a76e006c1924f50fbd2ef458a5"
  make INSTALL_ROOT="$pkgdir/" install
}

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
source=("https://github.com/oferkv/phototonic/archive/affa7c3369f450701839b8f5bb3f37a1a83639a1.tar.gz")
md5sums=('6718d35125526b8f9710e0efa6a24cad')

build() {
  cd "$srcdir/$pkgname-affa7c3369f450701839b8f5bb3f37a1a83639a1"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-affa7c3369f450701839b8f5bb3f37a1a83639a1"
  make INSTALL_ROOT="$pkgdir/" install
}

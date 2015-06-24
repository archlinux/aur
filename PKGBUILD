pkgname=phototonic
pkgver=1.5.54
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/06e2f123ac1f8f368dcb4db641c05d92f69f966b.tar.gz")
md5sums=('f3b8d405cf3be8460c1347ce3c225340')

build() {
  cd "$srcdir/$pkgname-06e2f123ac1f8f368dcb4db641c05d92f69f966b"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-06e2f123ac1f8f368dcb4db641c05d92f69f966b"
  make INSTALL_ROOT="$pkgdir/" install
}

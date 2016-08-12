# Contributer: Donald Carr<sirspudd@gmail.com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=artriculate
pkgver=0.1
pkgrel=1
pkgdesc='QML box2d application for displaying artwork'
arch=('x86_64' 'i686')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
depends=('qt5-declarative' 'qml-box2d')
source=("git://github.com/sirspudd/artriculate#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/"$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir"/"$pkgname"
  INSTALL_ROOT="$pkgdir" make install
}

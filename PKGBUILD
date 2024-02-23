# Maintainer: Harry Jeffery <me@harry.pm>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=qt-inspector-git
pkgver=r70.0e538d3
pkgrel=1
pkgdesc="A tool to visualize tree of widgets in a Qt application"
url="https://github.com/robertknight/Qt-Inspector"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt4>=4.5' 'protobuf')
makedepends=('git' 'cmake')
source=("git+https://github.com/robertknight/Qt-Inspector")
sha1sums=('SKIP')

pkgver() {
  cd Qt-Inspector
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Qt-Inspector
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd Qt-Inspector
  make DESTDIR="$pkgdir" install
}

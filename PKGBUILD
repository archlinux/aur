# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
pkgname=kgraphviewer
pkgver=2.2.0
pkgrel=2
pkgdesc="A Graphviz dot graph file viewer for KDE"
arch=('i686' 'x86_64')
url="http://www.kde.org/applications/graphics/kgraphviewer/"
license=('GPL' 'FDL')
depends=('kdebase-runtime' 'graphviz')
makedepends=('cmake' 'automoc4' 'boost' 'docbook-xsl')
install=kgraphviewer.install
source=("http://download.kde.org/stable/kgraphviewer/${pkgver}/src/kgraphviewer-${pkgver}.tar.xz")
md5sums=('043ace59a061a99fff2757a17be4e1d6')

build(){
  cd "$srcdir"

  mkdir -p build
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

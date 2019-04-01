# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=tkhtml
pkgver=3a16
pkgrel=1
pkgdesc="A Tcl/Tk widget that displays HTML"
url="https://github.com/Geballin/PgBrowse"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://tkhtml.tcl.tk/tkhtml3-alpha-16.tar.gz")

md5sums=(1bed3863ded3f695b6fe65ec02e7c0df
         )

build() {
  cd $startdir/src/htmlwidget
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make
}

package() {
  cd $startdir/src/htmlwidget
  make DESTDIR="${pkgdir}" install
}

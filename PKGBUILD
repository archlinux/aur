# Maintainer: frimen <frimen.c@gmail.com>
# Contributor: 100best

pkgname=udefrag
pkgver=5.0.0AB.8
pkgrel=1
pkgdesc="Ultradefrag 5.0 console for GNU/Linux to defragment a NTFS filesystem"
url="http://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
arch=('x86_64')
license=('GPL')
makedepends=('unzip')
depends=('ncurses' 'ntfs-3g')
source=("http://jp-andre.pagesperso-orange.fr/ultradefrag-${pkgver}.zip" "udefrag.patch")
md5sums=('e6de75d30f92d4c5e211470f6fe28be5'
         'f9813005670f6657417fb65769683257')

prepare() {
  patch -p 1 -i udefrag.patch
}

build() {
  cd $srcdir/ultradefrag-${pkgver}/src
  make
}

package() {
  cd $srcdir/ultradefrag-${pkgver}/src
  mkdir -p $pkgdir/usr/bin
  cp udefrag $pkgdir/usr/bin
}

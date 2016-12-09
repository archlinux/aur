# Maintainer: 100best <jm dot 100best at gmail dot com>

pkgname=udefrag
pkgver=5.0.0AB.7
pkgrel=1
pkgdesc="Ultradefrag 5.0 console for GNU/Linux to defragment NTFS filesystem"
url="http://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
arch=('x86_64')
license=('GPL')
makedepends=('unzip')
depends=('ncurses' 'ntfs-3g')
source=('http://jp-andre.pagesperso-orange.fr/ultradefrag-5.0.0AB.7.zip' 'udefrag.patch')
md5sums=('20cdd938bed3efa5161aefc0ad08ba00'
         '56db0ac242fceda8f38444e4a8cc173b')

prepare() {
  cp udefrag.patch $srcdir/ultradefrag-5.0.0AB.7
  cd $srcdir/ultradefrag-5.0.0AB.7
  patch -p 1 -i udefrag.patch
}

build() {
  cd $srcdir/ultradefrag-5.0.0AB.7/src
  make
}

package() {
  cd $srcdir/ultradefrag-5.0.0AB.7/src 
  mkdir -p $pkgdir/usr/bin
  cp udefrag $pkgdir/usr/bin
}

# Maintainer: 100best <jm.100best@hotmail.com>

pkgname=udefrag
pkgver=5.0.0AB.7
pkgrel=1
pkgdesc="Ultradefrag 5.0 console for GNU/Linux to defragment NTFS filesystem"
url="http://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('unzip')
depends=('ncurses' 'ntfs-3g')
source=('http://jp-andre.pagesperso-orange.fr/ultradefrag-5.0.0AB.7.zip' 'udefrag.patch')
md5sums=('20cdd938bed3efa5161aefc0ad08ba00'
         'a9a7993bbe81af2a0c78402ba350850c')

prepare() {
  mv udefrag.patch $srcdir/ultradefrag-5.0.0AB.7
  cd $srcdir/ultradefrag-5.0.0AB.7
  patch -p1 -i udefrag.patch
}

package() {
  cd $srcdir/ultradefrag-5.0.0AB.7/src
  make
  cd $srcdir
  mkdir usr
  mkdir usr/bin
  mv $srcdir/ultradefrag-5.0.0AB.7/src/udefrag $srcdir/usr/bin
  mv $srcdir/usr $pkgdir
}

# Contributor: 100best

pkgname=udefrag
pkgver=5.0.0AB.7
pkgrel=2
pkgdesc="Ultradefrag 5.0 console for GNU/Linux to defragment a NTFS 
filesystem"
url="http://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
arch=('x86_64')
license=('GPL')
makedepends=('unzip')
depends=('ncurses' 'ntfs-3g')
source=('http://jp-andre.pagesperso-orange.fr/ultradefrag-5.0.0AB.7.zip' 'udefrag.patch')
md5sums=('20cdd938bed3efa5161aefc0ad08ba00'
         'f34736c6b3baa2ab05bfc043f29c473b')

prepare() {
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

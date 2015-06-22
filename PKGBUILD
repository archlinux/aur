# Contributor: Alexander Zubkov <green@msu.ru>
pkgname=qmail-qfilter
pkgver=2.1
pkgrel=1
pkgdesc="qmail-queue multi-filter front end"
arch=('i686' 'x86_64')
url="http://untroubled.org/qmail-qfilter/"
license=('GPL')
depends=('bglibs')
source=("http://untroubled.org/qmail-qfilter/$pkgname-$pkgver.tar.gz")
md5sums=('744c4399a7f8c94b6c198e3de9941093')

build() {
  cd $srcdir/$pkgname-$pkgver
  echo "/usr/bin" >conf-bin
  echo "/usr/share/man" >conf-man
  echo "gcc $CFLAGS" >conf-cc
  echo "gcc $CFLAGS -s" >conf-ld
  echo "/usr/lib/bglibs/include" >conf-bgincs
  echo "/usr/lib/bglibs/lib" >conf-bglibs
  make || return 1
  make install install_prefix=$startdir/pkg || return 1
}

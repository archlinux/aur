# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3wrap
pkgver=0.5
pkgrel=5
pkgdesc="Tool for wrapping mp3 files. A free independent alternative to AlbumWrap"
arch=('x86_64')
url="http://mp3wrap.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/mp3wrap/mp3wrap-$pkgver-src.tar.gz")
sha512sums=('2dc7a72a12b9245956000443a51cd5341e1d48795b629f6277f9dd26ac9b3ab2511a119478a10daa9516cb2526073956af42f83410aff1e4eae0c972fdd8b0f1')

build() {
  cd $srcdir/mp3wrap-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/mp3wrap-$pkgver
  make DESTDIR=$pkgdir install
}

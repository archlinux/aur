# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3wrap
pkgver=0.5
pkgrel=4
pkgdesc="Tool for wrapping mp3 files. A free independent alternative to AlbumWrap"
arch=('i686' 'x86_64')
url="http://mp3wrap.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/mp3wrap/mp3wrap-$pkgver-src.tar.gz")
md5sums=('096b46295cbe3ee2f02ca7792517dc36')

build() {
  cd $srcdir/mp3wrap-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/mp3wrap-$pkgver
  make DESTDIR=$pkgdir install
}

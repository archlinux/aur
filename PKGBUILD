# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.6.1a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Library for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
makedepends=('git')
depends=('libmad' 'libvorbis' 'libid3tag' 'libtool')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  libtoolize --copy --force
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
md5sums=('a6a00d83e49adf27abb7a0cb0ea384a4')

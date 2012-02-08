# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.7
pkgrel=2
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('i686' 'x86_64')
url="http://mp3splt.sourceforge.net"
license=('GPL')
depends=('libmad' 'libvorbis' 'libid3tag' 'libtool')
makedepends=('git')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
md5sums=('dadb166361e2a28955032a1b9f10ed38')

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

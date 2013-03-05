# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.8.1a
pkgrel=1
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('i686' 'x86_64')
url="http://mp3splt.sourceforge.net"
license=('GPL')
depends=('libmad' 'libvorbis' 'libid3tag' 'pcre' 'libltdl')
makedepends=('libtool')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz")

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
md5sums=('5889dad7fc9443cd61987309622aa382')

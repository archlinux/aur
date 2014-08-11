# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.9.1a
pkgrel=1
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('i686' 'x86_64')
url="http://mp3splt.sourceforge.net"
license=('GPL')
depends=('flac' 'libmad' 'libvorbis' 'libid3tag' 'pcre' 'libltdl')
makedepends=('libtool')
source=("http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz")

prepare() {
  cd $srcdir/$pkgname-$pkgver
  libtoolize --copy --force
  ./autogen.sh
}

build() {
   cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
md5sums=('a8b0de4de80d915fa02ab9bed890d6be')

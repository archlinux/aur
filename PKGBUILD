# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.7.1
pkgrel=1
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('i686' 'x86_64')
url="http://mp3splt.sourceforge.net"
license=('GPL')
depends=('libmad' 'libvorbis' 'libid3tag' 'pcre' 'libltdl')
makedepends=('libtool')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz")
md5sums=('62025951f483334f14f1b9be58162094')

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

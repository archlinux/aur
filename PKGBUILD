# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.9.2
pkgrel=2
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('x86_64')
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
sha512sums=('e5c98e8b173bc86302ccee4ca5eb0c8a8d93f225357eb7b14dea8d0700ed62ed6316506c182f6b295130f7924ff0b38e865d5e49fa9cd7882c648360d68872ed')

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.9.2
pkgrel=4
pkgdesc="Library for splitting mp3 and ogg files without decoding"
arch=('x86_64')
url="http://mp3splt.sourceforge.net"
license=('GPL')
depends=('flac' 'libmad' 'libvorbis' 'libid3tag' 'pcre' 'libltdl')
makedepends=('libtool')
source=("https://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz")
sha512sums=('e5c98e8b173bc86302ccee4ca5eb0c8a8d93f225357eb7b14dea8d0700ed62ed6316506c182f6b295130f7924ff0b38e865d5e49fa9cd7882c648360d68872ed')

prepare() {
  cd $pkgname-$pkgver
  libtoolize --copy --force
  ./autogen.sh
}

build() {
   cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() { 
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.5.7a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Library for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmad' 'libvorbis' 'libid3tag' 'libtool')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  libtoolize --copy --force
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
}
md5sums=('93fd67d55b500735f1c42d260518505d')

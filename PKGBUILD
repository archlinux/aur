# $Id: PKGBUILD 13857 2008-09-29 03:24:40Z allan $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmp3splt
pkgver=0.5.4
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
  #patch -Np0 -i ../mp3splt-gcc4.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
  #mkdir -p $startdir/pkg/usr/bin
  #      for bin in mp3splt; do
  #              install -D -m755 $bin $startdir/pkg/usr/bin/$bin
  #      done
  #      install -D -m644 mp3splt.1 $startdir/pkg/usr/man/man1/mp3splt.1
}


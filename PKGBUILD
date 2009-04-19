# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.2.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Comandline tool for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmp3splt')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz mp3splt-gcc4.patch)
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

md5sums=('aa67e24931c62d2f09be13303fbf410e'
         '09e08026cd98cba4bd3f0d74951ef231')

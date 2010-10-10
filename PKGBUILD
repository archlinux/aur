# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.2.9
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Comandline tool for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmp3splt>=0.6')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-mp3splt-includes=/usr/include/libmp3splt --enable-oggsplt_symlink
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
}
md5sums=('1f2d3c42504774c5178ce97dcf173a19')

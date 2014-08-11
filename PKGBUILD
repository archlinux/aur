# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.6.1a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Commandline tool for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmp3splt')
source=("http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-mp3splt-includes=/usr/include/libmp3splt --enable-oggsplt_symlink
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
md5sums=('05677ad71d4988ee1eb4b8e236bd8212')

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.3a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Comandline tool for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmp3splt>=0.6.1a')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-mp3splt-includes=/usr/include/libmp3splt --enable-oggsplt_symlink
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
md5sums=('1fe663f7de5a6949bbe5b6aa78fea79f')

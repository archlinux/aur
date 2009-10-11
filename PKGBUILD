# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.2.6a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Comandline tool for splitting mp3 and ogg files without decoding"
license=('GPL')
url="http://mp3splt.sourceforge.net"
depends=('libmp3splt>=0.5.7a')
source=(http://downloads.sourceforge.net/sourceforge/mp3splt/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-mp3splt-includes=/usr/include/libmp3splt
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
}
md5sums=('4d49ad93f46ed8fcdf4bf2e269c80929')

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.6.2
pkgrel=2
arch=('x86_64')
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
sha512sums=('c1cbdc905d4f19e8e20afeadf02a2967049d86e69613312c8855e03afc5b190a569ac63f970171384853961cbe6bf248fae47e5116c4fe9deb7a0787f299918b')

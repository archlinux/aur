# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=w_scan
pkgver=20170107
pkgrel=1
pkgdesc="Universal ATSC and DVB blind scanner"
arch=('i686' 'x86_64' 'armv6h')
url="http://wirbel.htpc-forum.de/w_scan/index_en.html"
license=('GPL')
depends=('glibc')
source=("http://wirbel.htpc-forum.de/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('c7f9adf92d46b8da5391be80be6fbd72')

build() {
  cd "$srcdir/$pkgname-$pkgver" 
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README "$pkgdir/usr/share/doc/$pkgname"
}


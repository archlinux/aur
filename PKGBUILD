# Contributor: Peter Simons <simons@cryp.to>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=buddy
pkgver=2.4
pkgrel=2
pkgdesc="Binary Decision Diagram Library"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/buddy'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3b59cb073bcb3f26efdb851d617ef2ed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 444 README "$pkgdir/usr/share/licenses/$pkgname"
}


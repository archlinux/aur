# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=tbclock
pkgver=1.10
pkgrel=1
pkgdesc="Displays a full screen binary clock in your terminal."
arch=('i686' 'x86_64')
url="http://tamentis.com/projects/tbclock/"
license=('GPL')
depends=('ncurses')
source=(http://tamentis.com/projects/$pkgname/files/$pkgname-$pkgver.tar.gz)
md5sums=('0a0b499120603776a05daf283d18cb38')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 tbclock   "$pkgdir/usr/bin/tbclock"
  install -D -m644 tbclock.1 "$pkgdir/usr/share/man/man1/tbclock.1"
}

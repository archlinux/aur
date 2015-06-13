# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=kusemono
pkgver=20120519
pkgrel=1
pkgdesc="Sneak into a mutant ant hive and stab them."
arch=('i686' 'x86_64')
url="http://www.interq.or.jp/libra/oohara/kusemono/index.html"
license=('custom')
depends=('ncurses')
source=(http://www.interq.or.jp/libra/oohara/kusemono/kusemono-$pkgver.tar.gz)
md5sums=('a16a153d64e5959e00e13921a411a766')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README   "$pkgdir/usr/share/doc/$pkgname/README"
}


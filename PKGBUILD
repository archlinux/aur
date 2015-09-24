# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=esnc
pkgver=1.0
pkgrel=1
pkgdesc="A fork of Ersatz Emacs, the smallest of the microEmacs forks."
arch=(i686 x86_64)
url="http://essence.tuxfamily.org/"
license=('GPL')
depends=('ncurses')
source=("http://essence.tuxfamily.org/$pkgname-$pkgver.tar.bz2")
md5sums=('1343db23bd226a7ebcf19fe6edbd04ac')
sha1sums=('4750294a8ed0863f331c811899c05d96c7461781')
sha256sums=('5d61da743bbfd11515bb0c157fba0bd6bed9e6211fb7892811fd55ec14bb52eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/termcap/ncursesw/' Makefile # link against ncurses
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 Essence.keys "$pkgdir/usr/share/$pkgname/Essence.keys"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}


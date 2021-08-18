# Maintainer : silverhikari
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Humbert Julien <julroy67 [AT] gmail.com>

pkgname=zinnia
pkgver=0.07
pkgrel=1
pkgdesc="Simple, customizable and portable online hand recognition system based on Support Vector Machines"
arch=('x86_64')
url="https://github.com/silverhikari/zinnia"
license=('BSD')
depends=('gcc-libs')
source=("https://github.com/silverhikari/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a1f537b67ac37319740d747a5eb101f0a327b0c483aecf8030c32eb3a133b07f')
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

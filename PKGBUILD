# Maintainer: danitool dgcbueu at gmail.com

pkgname=osd_clock
pkgver=0.6.1
pkgrel=2
pkgdesc="A clock which uses the X On-Screen Display library"
arch=('i686' 'x86_64')
source=("https://github.com/danitool/osd_clock/archive/${pkgver}.tar.gz")
license=('GPL2')
depends=('xosd' 'gnu-free-fonts')
makedepends=('make')
md5sums=('423cb31dfb4d07beda34f974d5e1b9c3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m 644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}

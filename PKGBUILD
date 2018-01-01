# Maintainer: Hendrik Werner <hendrik.to@gmail.com>

pkgname=backlight_control
pkgver=1.0
pkgrel=1
pkgdesc='Simple backlight brightness control'
arch=('x86_64')
url='https://github.com/Hendrikto/backlight_control'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hendrikto/backlight_control/archive/$pkgver.tar.gz")
md5sums=('0b32929f59852aa7a71d25c889d4255b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p -m 750 $pkgdir/etc/sudoers.d
	make DESTDIR=$pkgdir prefix='/usr' install
}

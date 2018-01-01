# Maintainer: Hendrik Werner <hendrik.to@gmail.com>

pkgname=backlight_control
pkgver=1.1
pkgrel=1
pkgdesc='Simple backlight brightness control'
arch=('x86_64')
url='https://github.com/Hendrikto/backlight_control'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hendrikto/backlight_control/archive/$pkgver.tar.gz")
md5sums=('e233b7a0785fe3074f598e5b99b867d6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix='/usr' install
	install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

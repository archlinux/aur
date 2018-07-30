# Maintainer: Hendrik Werner <hendrik.to@gmail.com>

pkgname=backlight_control
pkgver=1.3
pkgrel=1
pkgdesc='Simple backlight brightness control'
arch=('x86_64')
url='https://github.com/Hendrikto/backlight_control'
license=('MIT')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Hendrikto/backlight_control.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	git checkout $pkgver
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix='/usr' install
	install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

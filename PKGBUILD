# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=mocu-xcursor
pkgver=1.0
pkgrel=1
pkgdesc='A modest xcursor theme, inspired by DMZ and cz-Viator.'
arch=(any)
url='https://github.com/sevmeyer/mocu-xcursor'
license=('CC0')
makedepends=('xmlstarlet' 'xorg-xcursorgen' 'librsvg')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.zip"::'https://github.com/sevmeyer/mocu-xcursor/archive/refs/tags/1.0.zip')
md5sums=('2835e969ed7856e3cb959707dc895422')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./make.sh
}

package() {
	mkdir -p "$pkgdir"/usr/share/icons
	cp -R "$srcdir/$pkgname-$pkgver"/dist/* \
	           "$pkgdir"/usr/share/icons
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=xcursor-haiku
pkgdesc='Haiku cursors as a xcursor theme, using the haiku-icons repository'
pkgver=4
pkgrel=1
url=https://codeberg.org/aperezdc/xcursor-haiku
arch=(any)
makedepends=(librsvg xorg-xcursorgen python)
license=(MIT)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.lz")
b2sums=('edf5608ec6caa39dd2de540daf512d9ac0254e20e5ca16225b5e45d33648a5b81502f610f4264a229f83a4b3a1a9e5c704c3eac2adc478076447c44af59aa4fd')

build () {
	cd "$pkgname-$pkgver"
	make Makefile.rules
	make
}

package () {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/icons"
	cp -a Haiku "$pkgdir/usr/share/icons/"
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=xcursor-haiku
pkgdesc='Haiku cursors as a xcursor theme, using the haiku-icons repository'
pkgver=3
pkgrel=1
url=https://codeberg.org/aperezdc/xcursor-haiku
arch=(any)
makedepends=(librsvg xorg-xcursorgen python)
license=(MIT)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.lz")
b2sums=('478c92b041a392f7ef8aaaee0d4e7ff3a41f47ca0e7672fa3b161adf4fa8fdcab48f5b1376af89d13afb2601e5461857b504596bd90626b1b119858d73e4707d')

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

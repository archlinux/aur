# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots>=0.13')
makedepends=('wayland-protocols')
source=("https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz"
        config.h)
sha256sums=('4c65ba86608adc0d37414ebfaf814957d3349518e44f3cc6f50f5f3bd827c150'
            '0bf53ab668252bf63b25e1b3ea76ace85c0dd3cd49e16168e85a3b49f4a3c708')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cp "$srcdir/config.h" config.h
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
}

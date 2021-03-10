# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.2
pkgrel=2
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots')
makedepends=('wayland-protocols')
source=("https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz"
        config.h)
sha256sums=('ee03a2cac6c4477702c8014e5ae5455c0acf4f47b87441c06e5da545ec234fa1'
            'SKIP')

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

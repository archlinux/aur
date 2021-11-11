# Maintainer: Oliver Giles <web ohwg net>
pkgname=timezone-clock
pkgver=0.1
pkgrel=1
pkgdesc="GTK app for comparing timezones"
arch=('x86_64')
url="https://github.com/ohwgiles/timezone-clock"
license=('GPL3')
groups=()
depends=('gtk4')
makedepends=('meson' 'ninja')
options=('strip')
source=("https://github.com/ohwgiles/timezone-clock/archive/refs/tags/$pkgver.tar.gz")
md5sums=('898229fcf3e276a87d422cbea0c941b8')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir/" meson install -C build
}


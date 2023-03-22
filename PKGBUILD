# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=furtherance
pkgver=1.7.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(any)
url=https://github.com/lakoliu/$pkgname
license=(GPL3)
depends=(libadwaita sqlite)
makedepends=(git meson rust)
source=(git+$url#tag=v$pkgver)
b2sums=(SKIP)

prepare() {
	cd $pkgname
	cargo update
}

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.5.4
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=('x86_64' 'aarch64')
url=https://github.com/lakoliu/$pkgname
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6c83947feccb521b4c23dde1321ae2776ffd7adad20fcbeb0a223ff0858878ed')

prepare() {
	cd Furtherance-$pkgver
	cargo update
}

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

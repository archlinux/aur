# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.6.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=('x86_64' 'aarch64')
url=https://github.com/lakoliu/$pkgname
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9bc237920417ace23b1719fff89bc979e1bc7d4c488d66125eaac7f1ee54c5f1')

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

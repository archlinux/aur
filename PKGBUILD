# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.0.8
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('964ad65ff9b02be3a3acd452d452546aaea1d21c993c40d1babb6f7eac3986ca')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

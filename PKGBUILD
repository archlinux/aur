# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.2.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6e6c5ee939597ae546b5a01ae28ff92a1b91121f59c0962a34cc5ee6327bbb3f')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

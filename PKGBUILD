# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.0.9
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c9c5eef4219bbbf5aa1050da5f7a69b9a73f1fa1f2fd6b20945174370db78d9c')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

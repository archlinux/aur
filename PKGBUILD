# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.5.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d6356cd427e2c3609c1bbc882ae1bba55cf70e9cde6b386e232dfceb9f12d34a')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

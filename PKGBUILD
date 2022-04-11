# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.1.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('533ca7f4f53072e87a10c64aa8f8bf86b8ac3ceb2172c15aed232b93b9ce638d')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

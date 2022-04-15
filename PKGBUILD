# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.1.1
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f839d55e7720af71f7860c127d47b1fc0844b4e453d657b412874dbc9edb636a')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

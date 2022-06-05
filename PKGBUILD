# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.4.0
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6bf035640fe161440d2acd65af9694285c4ef5a73197a007d09fa07a941c4964')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.1.2
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8ddb37c42907e4b621d8a69dea7b67129833edc576e1f30e308c6236ee690c2b')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

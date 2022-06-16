# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.5.1
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d109077f316f8e3fad52f492c95dfc584841cdd2310200db4896b9f0a2fa47ed')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

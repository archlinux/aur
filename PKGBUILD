# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance
pkgver=1.5.3
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=('x86_64' 'aarch64')
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('meson' 'rust')
source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('33514c147a83adc7fef334f9c88d7bf6b4a9c0257e8fc76e96e811ae32e02e01')

build() {
	arch-meson Furtherance-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

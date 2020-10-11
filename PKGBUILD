# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.3.1
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gst-plugins-good' 'ffmpeg')
makedepends=('meson' 'rust')
checkdepends=('appstream')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('64927929eb3d55c25a26bdec46aac8ff35cab8a7b3c59fe873a576c6c7480fcb')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

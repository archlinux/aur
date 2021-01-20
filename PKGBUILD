# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.4.1
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gst-plugins-good' 'ffmpeg')
makedepends=('meson' 'rust')
checkdepends=('appstream')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2609a3d6065c6f0057fc090daa81ca66c19d9d6c938c4314f99fff8d17c2205e')

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

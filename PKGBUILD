# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.4.2
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gst-plugins-good' 'ffmpeg')
makedepends=('meson' 'rust')
checkdepends=('appstream')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5209cf2df903ed26c5c3471819c98da69a2a0d7fc7727578495fd3055d84e24c')

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

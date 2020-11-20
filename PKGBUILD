# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.4.0
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gst-plugins-good' 'ffmpeg')
makedepends=('meson' 'rust')
checkdepends=('appstream')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('f648ae064768f823b7bbb7692d12fbabb1fffe0c53315e80fbd42bedb8ad628b')

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

# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.0.2
pkgrel=2
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL")
depends=("libadwaita" "libclapper" "libclapper-gtk")
makedepends=("blueprint-compiler" "rust" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
sha256sums=("d23105ee5495e702a6fff359c16b18f7bb4d2c02ff65a3f9fe51891219f772f1")
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}

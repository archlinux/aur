# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=1.15.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL")
depends=("libadwaita")
makedepends=("rust" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
sha256sums=("bc8ff1ac2cc4c4993382229aeb247b3b8164a807878f63ec764dcdb216efe616")
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}

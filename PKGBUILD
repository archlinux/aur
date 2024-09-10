# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.0.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL")
depends=("libadwaita")
makedepends=("blueprint-compiler" "rust" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
sha256sums=("7611d2b5ac879b9598a6921c94023cf3df3767c3f777accd26376dcb03296853")
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}

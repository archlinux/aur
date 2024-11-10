# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.0.3
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
sha256sums=("0a68a1c106cf6fa049a1cd528e13420152573f4f6939e864b97d95825ee696e1")
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}

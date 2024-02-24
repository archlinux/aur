# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=1.14.5
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
sha256sums=("748e3901f92b255980d88a1cfc6ff8ea714dcf42bad2bb020a8cb52715ae555d")
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}

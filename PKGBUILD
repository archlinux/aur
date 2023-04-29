# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=snapshot
pkgver=44.0
pkgrel=1
pkgdesc='Take pictures and videos on your computer, tablet, or phone'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/Incubator/snapshot'
license=(GPL3)
depends=(
	glib2
	gst-plugin-pipewire
	gst-plugins-bad
	gst-plugins-base
	gst-plugins-good
	gstreamer
	gtk4
	libadwaita
	pipewire
	xdg-desktop-portal
)
makedepends=(
	meson
	cargo
	clang
)
source=("$url/-/archive/$pkgver/snapshot-$pkgver.tar.gz")
b2sums=('1139df7e83e690cffbf2b6fe775ac220e30c2b2122861b77395accf281e12ebc7e546038d9b60ac31e29fc8a31dcca61b5df23202d4109a7db0e04ab81d7c285')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

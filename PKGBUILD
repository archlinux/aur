# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.20.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	mutter
	wlroots
)
makedepends=(
	ctags
	libhandy
	meson
	vala
	wayland-protocols
)
source=("${url}/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
b2sums=('88ddf67905282fb8a9fc0f1cfce048ed837abb159a250c2a28ac5a0da33e1a4f0ba5a5ef3a49e089073d123039dbac7296c4c1f5bf5454324d2fab47d7a0e4a3')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

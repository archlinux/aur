# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.21.beta1
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
_commit=0.21.0_beta1
source=("${url}/-/archive/v${_commit}/phoc-v${_commit}.tar.gz")
b2sums=('d6003ec553a0694ee7bd8d13c6f077de3d6b631d4da1a76e20f2390bebcaf3ebfa9b8be709cfef71eb9eb7d82eb7ad239d22fdab63e66ca442cde67f9e4b1b40')

build() {
	arch-meson phoc-v${_commit} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

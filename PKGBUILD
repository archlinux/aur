# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.11.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor'
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
arch=(x86_64 aarch64)
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
sha256sums=('237ce471bdf01a14259f33725632deceaf429353766205beeb9d96a3fb921de1')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

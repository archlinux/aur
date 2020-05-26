# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=xdg-desktop-portal-wlr
pkgver=0.1.0
pkgrel=4
pkgdesc='xdg-desktop-portal backend for wlroots'
url=https://github.com/emersion/xdg-desktop-portal-wlr
arch=(x86_64)
license=(MIT)
provides=(xdg-desktop-portal-impl)
depends=(xdg-desktop-portal pipewire)
makedepends=(meson wayland-protocols wayland)
source=(
  "${pkgname}-${pkgver}::https://github.com/emersion/xdg-desktop-portal-wlr/archive/v${pkgver}.tar.gz"
)
sha256sums=('69d67c236f4bd498323af509d44ec4a1b826da337f7ee64bbfbdb98bfda8e541')

build () {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}


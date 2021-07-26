# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Client-side decorations library for Wayland clients'
pkgname=libdecor
pkgver=0.1.0
pkgrel=1
url=https://gitlab.gnome.org/jadahl/libdecor
arch=(x86_64)
depends=(wayland pango dbus)
makedepends=(ninja meson)
source=("${url}/uploads/81adf91d27620e20bcc5f6b9b312d768/${pkgname}-${pkgver}.tar.xz")
sha512sums=('4b8bf44104eec639b191e811e311be27dc68f72f3143636cc954a7d0086a4b5e046d139ece1a6062ce74683cbd83f69a87bb2222873f261420fed32a08373257')

build () {
	rm -rf _build
	arch-meson _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

check () {
	meson test -C _build
}

package () {
	meson install -C _build --destdir "${pkgdir}"
}

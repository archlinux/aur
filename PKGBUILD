# Maintainer: Philip Goto <philip.goto@gmail.com>
# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=loupe
pkgver=44.0
pkgrel=1
pkgdesc='Simple image viewer for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/Incubator/loupe'
license=(GPL)
depends=(
	gtk4
	libadwaita
	libgweather-4
	libheif
)
makedepends=(
	git
	itstool
	meson
	rust
)
source=("${url}/-/archive/${pkgver}/loupe-${pkgver}.tar.gz")
b2sums=('89bc97c45b74a93893b29ea85d033f4d1508bbc0b43c2291739cfc545580f81cffa66ba902c75201cbe8bdd3153dbae531345b811d88cc1407625eecb267b0e8')

build() {
	arch-meson loupe-${pkgver} build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	meson install -C build --destdir "${pkgdir}"
}


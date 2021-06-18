# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Plot on the command line'
pkgname=plot
pkgver=0.5.0
pkgrel=1
url=https://github.com/annacrombie/plot
license=(custom:MIT)
arch=(x86_64)
depends=(ncurses)
makedepends=(meson ninja scdoc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('60aefbe36c76a7558019fee49afcafd52f5aea4e69b751de0c379dfeabf3e45ce734622580dac2d822ebadcb8649cf570687c7096b7fe604f5b92b8e679907bf')

build () {
	arch-meson _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

check () {
	meson test -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

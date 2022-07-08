# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>

pkgname=pingtcp
pkgver=0.0.6
pkgrel=1
pkgdesc="Small utility to measure TCP handshake time (torify-friendly)"
url="https://codeberg.org/post-factum/${pkgname}"
arch=(x86_64)
license=(GPL3)
depends=(libbsd)
makedepends=(meson)
optdepends=("torsocks: for TOR support")
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/post-factum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('687ce10f8dc8446d9253c3bbca9dedeae8a91f9cf81a855ae0ed41017318e3f4')

build() {
	cd ${pkgname}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${pkgname}

	meson install -C build --destdir "${pkgdir}"
}


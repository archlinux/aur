# Maintainer: Salif Mehmed <mail@salif.eu>
pkgname=nemo_gleam
pkgver=1.2.0
pkgrel=1
pkgdesc="Nemo extension for Gleam development"
arch=('x86_64')
url="https://github.com/salif/nemo_gleam"
license=('Apache-2.0')
#groups=()
depends=('gleam' 'zenity' 'erlang-nox')
#makedepends=()
optdepends=('nemo')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=CHANGELOG
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/salif/nemo_gleam/archive/refs/tags/v${pkgver}.tar.gz")
#noextract=()
sha256sums=('fa404eb5bec9c9dc69f3c5438615798fa113c1fd7f000f03672d6969f303744d')

build() {
	cd "${pkgname}-${pkgver}"
	gleam export erlang-shipment
}

package() {
	cd "${pkgname}-${pkgver}"
	./build/erlang-shipment/entrypoint.sh run self-install system destdir "${pkgdir}"
}

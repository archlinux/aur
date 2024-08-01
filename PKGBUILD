# Maintainer: Salif Mehmed <mail@salif.eu>
pkgname=nemo_gleam
pkgver=1.3.0
pkgrel=1
pkgdesc="GUI extension for Gleam development"
arch=('x86_64')
url="https://codeberg.org/salif/nemo_gleam"
license=('Apache-2.0')
#groups=()
depends=('gleam' 'zenity' 'erlang-nox')
makedepends=('just')
optdepends=('nemo' 'dolphin' 'nodejs')
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=()
#install=
#changelog=CHANGELOG
source=("https://codeberg.org/salif/nemo_gleam/archive/v${pkgver}.tar.gz")
#noextract=()
sha256sums=('d7351b1f3733beb3623e6d2a341f80a332dc5f4ffc9f31d6f5d575c874ec1691')

build() {
	cd "${pkgname}"
	just make
	just make-js
}

package() {
	cd "${pkgname}"
	just DESTDIR="$pkgdir" install
}

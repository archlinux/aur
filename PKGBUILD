# Maintainer: Salif Mehmed <mail@salif.eu>
pkgname=nemo_gleam
pkgver=1.4.0
pkgrel=1
pkgdesc="Graphical user interface for Gleam development"
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
sha256sums=('5df257a243a898301393a24425fad9a47e768a3d85f44f035d2d0ff37f3fd030')

build() {
	cd "${pkgname}"
	just make
	just make-js
}

package() {
	cd "${pkgname}"
	just DESTDIR="$pkgdir" install
}

# Maintainer: David Buchanan <d@vidbuchanan.co.uk>
pkgname=fusee-nano
pkgver=0.5.3
pkgrel=1
pkgdesc="A minimalist re-implementation of the Fusée Gelée exploit"
arch=('any')
url="https://github.com/DavidBuchanan314/fusee-nano"
license=('MIT')
groups=()
depends=()
makedepends=("vim") # used for xxd
checkdepends=()
optdepends=()
provides=("fusee-nano")
conflicts=("fusee-nano-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidBuchanan314/fusee-nano/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=("8737fc7c842e19f288d537d6fe652b72d5c9b399a09c07beca643d3229ef012d")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install "PREFIX=${pkgdir}/usr/bin"
}

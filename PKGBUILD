
# Maintainer: Christian Rapp <0x2a@posteo.org>
pkgname=qaccordion
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="A Qt Widget that provides an Accordion control"
arch=('any')
url="https://github.com/crapp/qaccordion"
license=('GPL')
groups=()
depends=(qt5-base)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/crapp/qaccordion/archive/v0.2.2.tar.gz")
noextract=()
md5sums=('b62f1aa62d6b9309856582f3348b8824')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    mkdir build
    cd build
    cmake --DCMAKE_RELEASE_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
}

build() {
	cd "$pkgname-$pkgver/build"
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

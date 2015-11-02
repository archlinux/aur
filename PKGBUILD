
# Maintainer: Christian Rapp <0x2a@posteo.org>
pkgname=qaccordion
pkgver=0.1
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
source=("https://github.com/crapp/qaccordion/archive/v0.1.tar.gz")
noextract=()
md5sums=('1345d0493131f49d6a0935de64296411')
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

# Maintainer: Alban Fichet <alban.fichet@gmx.fr>
pkgname=spectral-viewer
pkgver=3.3.0
pkgrel=9
pkgdesc="Tool for visualising and manipulating spectral images and HDR images."
arch=('any')
url="https://mrf-devteam.gitlab.io/spectral-viewer/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-charts' 'qt5-svg' 'libtiff' 'openexr' 'eigen')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
# optdepends=('openexr' 'libtiff' 'eigen')
provides=($pkgname=$pkgver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://gitlab.com/mrf-devteam/spectral-viewer.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	git submodule init
	git submodule update
}

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

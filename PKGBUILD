# Maintainer: Alban Fichet <alban.fichet@gmx.fr>
pkgname=spectral-viewer
pkgver=3.0.1
pkgrel=1
pkgdesc="Tool for visualising and manipulating spectral images and HDR images."
arch=('any')
url="https://adufay.gitlabpages.inria.fr/SpectralViewer/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-charts' 'qt5-svg')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=('eigen3')
provides=($pkgname=$pkgver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://gitlab.inria.fr/adufay/SpectralViewer.git")
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
	cmake . -DINSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

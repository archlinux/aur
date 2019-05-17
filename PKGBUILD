# Maintainer: Gerald Bischof gBischof at gebix dot com
pkgname=pdfmerger
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="A simple Qt frontend for poppler's pdfunite"
arch=(x86_64)
url="https://gitlab.com/gBischof/pdfmerger/releases"
license=('GPL3')
groups=()
depends=(poppler qt5-base)
makedepends=(qt5-tools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://gitlab.com/gBischof/pdfmerger.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git checkout -q v$pkgver
}

build() {
	cd "$pkgname"
	qmake
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}

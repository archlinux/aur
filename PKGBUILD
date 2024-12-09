# Maintainer: Leca <leca@foxarmy.org>
pkgname=checks-parser-git
pkgver=alpha_0.0.3
pkgrel=1
epoch=
pkgdesc="Utility for parsing checks(receipts) to csv"
arch=('x86_64')
url="https://git.foxarmy.org/leca/checks-parser"
license=('GPL-3.0-or-later')
groups=()
depends=('qt5-base' 'opencv' 'zbar' 'nlohmann-json' 'tesseract')
makedepends=('cmake' 'make' 'gcc' 'git' 'qt5-tools')
checkdepends=()
optdepends=('tesseract-data-rus: scan russian checks with OCR')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("checks-parser-git::git+$url")
noextract=()
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make -j ${nproc}
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

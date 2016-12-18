# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matěj Týč <matej.tyc@gmail.com>
pkgname=argbash
pkgver=2.2.3
pkgrel=1
epoch=
pkgdesc="Bash argument parsing code generator"
arch=(any)
url="https://argbash.io"
license=('BSD')
groups=()
depends=('autoconf')
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/matejak/$pkgname/archive/$pkgver.tar.gz" LICENSE)
noextract=()
sha256sums=('8bec067fd029eed472185ca5ba567fe42c4d4a0d2652bb9dc0268e337e668dfc' '9ee9a6920cd16723e49b065f4ae101127d353fc5400d849e269482fbf4f56a45')
validpgpkeys=()

build() {
	true
}

check() {
	cd "$pkgname-$pkgver/resources"
	make check
}

package() {
	LICENSES="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$LICENSES"
	cp LICENSE "$LICENSES"

	cd "$pkgname-$pkgver/resources"
	make ROOT="$pkgdir" PREFIX="/usr" install
}

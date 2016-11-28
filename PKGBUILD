# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matěj Týč <matej.tyc@gmail.com>
pkgname=argbash
pkgver=2.2.2
pkgrel=1
epoch=
pkgdesc="Bash argument parsing code generator"
arch=(any)
url="https://github.com/matejak/argbash"
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
sha256sums=('2cb75918d6fd2648c337d3c746cfe38ec6710669ab873dcdc669f44dfb90c7ce' '9ee9a6920cd16723e49b065f4ae101127d353fc5400d849e269482fbf4f56a45')
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

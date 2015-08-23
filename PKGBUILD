# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <matej.tyc@gmail.com>
pkgname=argbash
pkgver=1.0.1
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
source=("$pkgname-$pkgver.tar.gz" LICENSE)
noextract=()
md5sums=('cea70f809ddc07c2d2d927831e2b2a6d' '830d8b1dc53dad7f53d6112c924c91ec')
validpgpkeys=()

build() {
	true
}

check() {
	cd "$pkgname-$pkgver/resources"
	make -k check
}

package() {
	LICENSES="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$LICENSES"
	cp LICENSE "$LICENSES"

	cd "$pkgname-$pkgver/resources"
	make ROOT="$pkgdir" PREFIX="/usr" install
}

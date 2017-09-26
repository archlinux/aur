# Maintainer: Alin Porcic <alin.porcic@gmail.com>
pkgname=qlibc
pkgver=2.4.2
pkgrel=1
epoch=
pkgdesc="A simple and powerful C library."
arch=('any')
url="https://github.com/wolkykim/qlibc"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/wolkykim/qlibc/archive/v2.4.2.tar.gz")
noextract=()
md5sums=("86d434674491d9f9906a238f7bea8837")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make tests
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

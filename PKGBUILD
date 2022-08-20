# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Derek Hemingson <b.derehemi@gmail.com>
pkgname=caser
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Converts input strings to a standard naming convention."
arch=('any')
url="https://github.com/Shadetheartist/caser"
license=('GPL')
groups=()
depends=('glibc')
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Shadetheartist/caser/releases/download/${pkgver}/caser-${pkgver}.tar.gz")
noextract=()
sha256sums=('be2c0425d9a68c5dd7966a89008830b15178b92f147cd7edbebe1060be398e5d')
validpgpkeys=()

build() {
	cd "caser-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "caser-$pkgver"
	make check
}

package() {
	cd "caser-$pkgver"
	make DESTDIR="$pkgdir/" install
}

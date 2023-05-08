# Maintainer: Your Name <erik.knudsen@copenhagenatomics.com>
pkgname=mcpl
pkgver=1.6.1
pkgrel=1
epoch=
pkgdesc="A generic library for storing Monte Carlo particles in a dense file format."
arch=('x86_64')
url="https://mctools.github.io/mcpl/"
license=('custom:CC0')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=('zlib: compress or decompress datafiles')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/mctools/mcpl/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('7cf3d34e1c5b4dcef4e2dc40347d555cdd3899d860ff222a4a8e1f0a3383239e')
validpgpkeys=()
build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr/local
	make
}

check() {
        test -e /usr/local/lib/libmcpl.so
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

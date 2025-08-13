# Maintainer: Your Name <kitora@727pp.ru>
pkgname='uzer'
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="Uzer https://osu.ppy.sh/users/13583469"
arch=('any')
url="https://osu.ppy.sh/users/13583469"
license=('GPL')
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
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
sha256sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

check() {
	cd "$pkgname-$pkgver"
	echo "Check success!"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

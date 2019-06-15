# Maintainer: Filip Parag <aur@filiparag.com>
pkgname=sydf
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Symlink Your Damn Files"
arch=(any)
url="https://github.com/filiparag/sydf"
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
source=("https://github.com/filiparag/sydf")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	git clone $source "$pkgname-git"
}

pkgver() {
	cd "$pkgname-git"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	chmod +x "$pkgname-git/sydf"
}

check() {
	test -f "$pkgname-git/sydf"
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp "$pkgname-git/sydf"	${pkgdir}/usr/bin
}

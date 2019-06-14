# Maintainer: Filip Parag <aur@filiparag.com>
pkgname=sydf
pkgver=0.1.r3.g527d662
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
	git clone $source "$pkgname-$pkgver"
}

pkgver() {
  cd "$pkgname-$pkgver"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	chmod +x "$pkgname-$pkgver/sydf"
}

check() {
	test -f "$pkgname-$pkgver/sydf"
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp "$pkgname-$pkgver/sydf"	${pkgdir}/usr/bin
}

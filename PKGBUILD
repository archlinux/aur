# Maintainer: Alin Porcic <alin.porcic@gmail.com>
pkgname=i3brain
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A simple status bar for i3."
arch=('any')
url="https://github.com/onixion/i3brain"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/onixion/i3brain/archive/1.1.tar.gz")
noextract=()
md5sums=("8ef85ea4235ed7c92fe7beed269241c2")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -G "Unix Makefiles" ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}

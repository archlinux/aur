# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=termcolor
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A header-only C++ library for printing colored messages to the terminal"
arch=('x86_64')
url="https://github.com/ikalnytskyi/termcolor"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4a73a77053822ca1ed6d4a2af416d31028ec992fb0ffa794af95bd6216bb6a20')

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install
}

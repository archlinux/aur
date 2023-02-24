# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=termcolor
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="A header-only C++ library for printing colored messages to the terminal"
arch=('x86_64')
url="https://github.com/ikalnytskyi/termcolor"
license=('BSD')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('435994c32557674469404cb1527c283fdcf45746f7df75fd2996bb200d6a759f')

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	cmake --build .
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir/" cmake --install build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

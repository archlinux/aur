# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=termcolor
pkgver=1.0.1
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
sha256sums=("612f9ff785c74dcbe081bb82e8c915858572cf97dcf396ea7bd6a7d21cf6026a")

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

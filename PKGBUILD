# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rapidobj
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A fast, header-only, C++17 library for parsing Wavefront .obj files."
arch=('any')
url="https://github.com/guybrush77/rapidobj"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87640b4d70905081552d31a36e6b68a947e167ba379a7032a056986c16f716d3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build

	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

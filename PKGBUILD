# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.10.2
pkgrel=2
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/libcpr/cpr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('044e98079032f7abf69c4c82f90ee2b4e4a7d2f28245498a5201ad6e8d0b1d08')

build() {
	cmake -B "$srcdir"/build -S "$srcdir/cpr-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_USE_SYSTEM_CURL=ON
	cmake --build "$srcdir"/build
}

package() {
	cmake --install "$srcdir"/build --prefix "$pkgdir"/usr
}

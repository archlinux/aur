# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.10.4
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/libcpr/cpr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('88462d059cd3df22c4d39ae04483ed50dfd2c808b3effddb65ac3b9aa60b542d')

build() {
	cmake -B "$srcdir"/build -S "$srcdir/cpr-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_USE_SYSTEM_CURL=ON
	cmake --build "$srcdir"/build
}

package() {
	cmake --install "$srcdir"/build --prefix "$pkgdir"/usr
}

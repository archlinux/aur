# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.10.3
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/libcpr/cpr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b9d3504ffdaf7ce3189f1b91d135888776b6a1b26ea1bf2c3c4986b8a5af06f')

build() {
	cmake -B "$srcdir"/build -S "$srcdir/cpr-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_USE_SYSTEM_CURL=ON
	cmake --build "$srcdir"/build
}

package() {
	cmake --install "$srcdir"/build --prefix "$pkgdir"/usr
}

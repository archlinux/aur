# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.11.0
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/libcpr/cpr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fdafa3e3a87448b5ddbd9c7a16e7276a78f28bbe84a3fc6edcfef85eca977784')

build() {
	cmake -B "$srcdir"/build -S "$srcdir/cpr-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_USE_SYSTEM_CURL=ON
	cmake --build "$srcdir"/build
}

package() {
	cmake --install "$srcdir"/build --prefix "$pkgdir"/usr
}

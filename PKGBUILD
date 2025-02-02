# Maintainer: Pierre Carrier <pc@rrier.fr>
pkgname=identme
pkgver=0.2.1
pkgrel=1
pkgdesc="Public IP address lookup"
arch=('x86_64' 'aarch64')
url="https://www.ident.me"
license=('0BSD')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/pcarrier/ident.me/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1199360eb5561a00b275fda5a55c26091c78f4c2ae085f75e579eef202e4b2ed')

build() {
	find .
	cd "ident.me-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -B build cli
	cmake --build build
}

package() {
	cd "ident.me-$pkgver"
	DESTDIR="$pkgdir" cmake --install build
}

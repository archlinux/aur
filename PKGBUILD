# Maintainer: Pierre Carrier <pc@rrier.fr>
pkgname=identme
pkgver=0.6.0
pkgrel=1
pkgdesc="Public IP address lookup"
arch=('x86_64' 'aarch64')
url="https://www.ident.me"
license=('0BSD')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/pcarrier/ident.me/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e37f2f5b661ebe9731aab8d6d2ecdbea6e2239ea6f5ad1f2b158ea15fea947c')

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

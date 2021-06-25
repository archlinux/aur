# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>
pkgname=http-status-code-manpages
pkgver=0.2.0
pkgrel=1
pkgdesc="Man pages for HTTP status codes"
url="https://github.com/hugopl/http-status-code-manpages"
license=('WTFPL')
arch=('any')
depends=("man-db")
makedepends=("ruby" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/http-status-code-manpages/archive/v${pkgver}.tar.gz")
sha256sums=('8a84ebbd52cbb58faf5f73eee0dc1115ab95318015e7aa989f94803ccc41b6ab')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

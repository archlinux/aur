# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>
pkgname=http-status-code-manpages
pkgver=0.1.0
pkgrel=2
pkgdesc="Man pages for HTTP status codes"
url="https://github.com/hugopl/http-status-code-manpages"
license=('WTFPL')
arch=('any')
depends=("man-db")
makedepends=("ruby" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/http-status-code-manpages/archive/v${pkgver}.tar.gz")
sha256sums=('8e8567c73ada88eb38bcbb91660ee1cba334a9bd2d378bb47eaea7def99f579b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

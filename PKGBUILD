# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>
pkgname=http-status-code-manpages
pkgver=0.1.0
pkgrel=1
pkgdesc="Man pages for HTTP status codes"
url="https://github.com/hugopl/http-status-code-manpages"
license=('WTFPL')
arch=('any')
depends=("man-db")
makedepends=("ruby" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/http-status-code-manpages/archive/v${pkgver}.tar.gz")
sha256sums=('46c54ba1eb1a3d4e67508d75ebade54c6b888802621bee300b55ea486f98576f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=wcurl-git
pkgver=r17.e4a7f67
pkgrel=1
pkgdesc='a simple wrapper around curl to easily download files (git)'
arch=(any)
url=https://salsa.debian.org/debian/wcurl
license=(curl)
depends=(curl sh)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"$url")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm755 "${pkgname%-git}/wcurl" -t "$pkgdir/usr/bin"
}

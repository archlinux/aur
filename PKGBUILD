# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=s6-man-pages-git
pkgver=v2.10.0.2.1.r0.93b0e5c
pkgrel=1
pkgdesc='Manual pages for the s6 suite of software'
arch=('any')
url='https://github.com/flexibeast/s6-man-pages'
license=('ISC')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make MANPATH="$pkgdir/usr/share/man" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

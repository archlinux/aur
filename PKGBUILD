# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=scholarref-git
_pkgname=scholarref
pkgver=r29.98931f5
pkgrel=1
pkgdesc="POSIX shell tools to extract, fetch, and parse DOIs and BiBTeX bibliography references."
arch=('any')
url="https://src.adamsgaard.dk/scholarref/files.html"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=('articlesearch' 'getdoi' 'getref' 'shdl' 'scholarref')
conflicts=('articlesearch' 'getdoi' 'getref' 'shdl' 'scholarref')
source=('scholarref::git://src.adamsgaard.dk/scholarref')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr/local install
}

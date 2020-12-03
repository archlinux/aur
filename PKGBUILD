# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=scholarref-git
_pkgname=scholarref
_source=git://src.adamsgaard.dk/scholarref
pkgver=r53.691d247
pkgrel=1
pkgdesc="POSIX shell tools to extract, fetch, and parse DOIs and BiBTeX bibliography references."
arch=('any')
url="https://src.adamsgaard.dk/scholarref/files.html"
license=('GPL')
depends=('bash' 'xdg-utils')
makedepends=('git')
source=("${_pkgname}"::"${_source}")
md5sums=('SKIP')


pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}

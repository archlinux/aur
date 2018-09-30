# Maintainer: Anna <morganamilo@gmail.com>
_pkgname=putils
pkgname=putils-git
pkgver=r3.1e54e08
pkgrel=1
pkgdesc="Utilities for working with pipes"
arch=(x86_64)
url="https://github.com/Morganamilo/putils"
license=('GPL3')
makedepends=(git go asciidoc)
provides=(putils)
conflicts=(putils)
source=("git+https://github.com/Morganamilo/putils")
md5sums=('SKIP')

build() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" all
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install_all
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


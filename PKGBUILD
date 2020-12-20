# Maintainer: Paco Pascal <me@pacopascal.com>
_pkgname=guile-lzlib
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="Guile-lzlib is a GNU Guile library providing bindings to lzlib."
arch=('any')
url="https://notabug.org/guile-lzlib/guile-lzlib"
license=('GPL3')
depends=(guile lzlib)
makedepends=(autoconf automake pkg-config texinfo guile-hall)
source=("git+https://notabug.org/guile-lzlib/guile-lzlib.git")
md5sums=('SKIP')

build() {
	cd "$_pkgname"
	hall dist -x
	autoreconf -vif
	./configure --prefix=/usr
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}

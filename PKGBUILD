# Maintainer: Paco Pascal <me@pacopascal.com>
_pkgname=guile-zlib
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="Guile-zlib is a GNU Guile library providing bindings to zlib."
arch=('any')
url="https://notabug.org/guile-zlib/guile-zlib"
license=('GPL3')
depends=(guile zlib)
makedepends=(autoconf automake pkg-config texinfo guile-hall)
source=("git+https://notabug.org/guile-zlib/guile-zlib.git")
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

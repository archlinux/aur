# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=xe
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="simple xargs and apply replacement"
arch=(i686 x86_64 armv6h armv7h)
url="https://github.com/leahneukirchen/xe"
license=(CC0-1.0)
groups=()
depends=(glibc)
makedepends=()
checkdepends=(perl)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('b0401497e695dd04f17ae29c5113e3638c9b9d7b8ffda7b5fb4a1e3290626f66ca85ae6932cd27e35e077ff0c737f307f708ff44779096a34e3132a056d78e84')
validpgpkeys=()
_srcdir="$pkgname-$pkgver"

build() {
	cd "$_srcdir"
	make PREFIX=/usr
}

check() {
	cd "$_srcdir"
	make PREFIX=/usr check
}

package() {
	cd "$_srcdir"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

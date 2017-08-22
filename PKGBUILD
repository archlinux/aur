# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=rnm
pkgver=4.0.2
_pkgver="$pkgver-arch"
pkgrel=1
epoch=
pkgdesc="Bulk rename utility"
arch=('i686' 'x86_64')
url="https://github.com/neurobin/rnm"
license=('GPL3')
groups=()
depends=(gmp pcre2)
makedepends=(jpcre2)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( "https://github.com/neurobin/$pkgname/archive/$_pkgver.tar.gz" )
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$_pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$_pkgver.patch"
}

build() {
	cd "$pkgname-$_pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$_pkgver"
	make -k check
}

package() {
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: tequa
pkgname=eltclsh
pkgver=1.16
pkgrel=2
epoch=
pkgdesc="interactive shell for the TCL programming language"
arch=('i686' 'x86_64' 'armv7h')
url="http://homepages.laas.fr/mallet/soft/shell/eltclsh"
license=('BSD')
groups=()
depends=('tcl' 'tk' 'libedit')
makedepends=('make' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "tools.patch"
    "http://distfiles.openrobots.org/eltclsh/$pkgname-$pkgver.tar.gz"
)
noextract=()
md5sums=('af3e1e0eb06d1cebed7d4c1bdae5ff29'
         'a13130374265b871ff17fdec357aee60')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/tools.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

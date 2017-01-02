# Maintainer: tequa 
pkgname=eltclsh
pkgver=1.15
pkgrel=2
epoch=
pkgdesc="eltclsh (editline tcl shell) is an interactive shell for the TCL programming language"
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
source=("http://distfiles.openrobots.org/eltclsh/$pkgname-$pkgver.tar.gz"
        "editline_wchar.patch")
noextract=()
md5sums=('17f1f16ac44dff76a451fe62d8f4f8fd'
         'b6afc7dca1fe52d899886bf46652493a')
validpgpkeys=()

build() {
    cat "${srcdir}/editline_wchar.patch" | patch -p1
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

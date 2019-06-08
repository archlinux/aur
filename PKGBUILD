 # Maintainer: Dilawar Singh <dilawar.s.rajput@gmail.com
pkgname=smoldyn
_pkgname=smoldyn
pkgver=2.60
pkgrel=1
epoch=
pkgdesc="A particle-based biochemical simulator for modeling molecular diffusion, surface interactions, and chemical reactions"
arch=('i686' 'x86_64')
url="http://www.smoldyn.org"
license=('GPL')
groups=()
depends=( 'libtiff' 'freeglut' 'glu' 'libxmu')
makedepends=( 'mesa' 'libtiff' 'freeglut' 'glu' 'libxmu' )
checkdepends=()
optdepends=()
provides=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::http://www.smoldyn.org/smoldyn-$pkgver.tgz")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    ctest --output-on-failure
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

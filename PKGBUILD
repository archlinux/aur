pkgname=quantum-espresso
pkgver=6.4
pkgrel=1
epoch=
pkgdesc="Computer codes for electronic-structure calculations and materials modeling
at the nanoscale. It is based on density-functional theory, plane waves, and
pseudopotentials."
arch=("x86_64")
url="http://www.quantum-espresso.org"
license=('GPL')
groups=()
depends=()
makedepends=('gcc-fortran')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/QEF/q-e/-/archive/qe-$pkgver/q-e-qe-$pkgver.tar.gz"
	"https://gitlab.com/QEF/q-e/uploads/edd91febdd3916ce1d527ea00f0a05f0/fox.tgz")
noextract=("fox.tgz")
md5sums=('033fd5276607e15491ebdaab65581e87' '3e4765d44ad77f65ed70c9c2992c0b84')
validpgpkeys=()

build() {
	cd "$srcdir/q-e-qe-$pkgver"
	cp "$srcdir/fox.tgz" "$srcdir/q-e-qe-$pkgver/archive"
	FFLAGS="-ffree-line-length-none" ./configure --prefix="$pkgdir/usr"
	make all
}

package() {
	cd "$srcdir/q-e-qe-$pkgver"
	make install
}

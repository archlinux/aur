# Maintainer: imla assuom <imla.assuom@gmail.com>
pkgname=shiftsub-cli
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="a command line tool to shift subtitle times"
arch=('i686' 'x86_64')
url="https://github.com/imla/shiftsub-cli"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('shiftsub-cli')
conflicts=('shiftsub-cli')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/imla/shiftsub-cli.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESDIR="$pkgdir/" install
}

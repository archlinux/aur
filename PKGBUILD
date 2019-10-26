# Maintainer: 'Scott Hamilton <sgn DOT hamilton PLUS archlinux AT protonmail DOT com>'
# Packager: 'Scott Hamilton <sgn DOT hamilton PLUS archlinux AT protonmail DOT com>'

pkgname=monetcours
pkgdesc="A toolchain for creating class subjects webpages and more."
pkgver=1.1.2
pkgrel=1.0
epoch=
arch=('any')
url="https://scott-hamilton.github.io/"
license=('Apache')
groups=()
depends=( 'coreutils>=8.31' 'findutils>=4.7.0' 'gawk>=5.0.1' 'parallel' 'perl>=5.10.0' 'perl-pdf-api2' 'zip>=3.0')
makedepends=()
checkdepends=()
optdepends=()
provides=('monetcours')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SCOTT-HAMILTON/Monetcours-linux/archive/$pkgver.tar.gz")
noextract=()
md5sums=('02481995af23028ed9c774644fbb347c')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/monetcours"
	ls "$srcdir"
	echo "BINARIES : "
	find "$srcdir/Monetcours-linux-$pkgver/"  -not -path '*/\.*' -type f | grep -E "*.sh$|*.pl$|*.py$" | xargs -n1 -L1 -r -t -I{} mv {} "$pkgdir/usr/bin"
	find "$srcdir/Monetcours-linux-$pkgver/"  -not -path '*/\.*' -type f | grep -E -v "*.sh$|*.pl$|*.py$" | xargs -n1 -L1 -r -t -I{} mv {} "$pkgdir/usr/lib/monetcours"
	echo "BIN : "
	ls "$pkgdir/usr/bin"
	echo "LIB : "
	ls "$pkgdir/usr/lib/monetcours"
}

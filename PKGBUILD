# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ppmrose
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="unwarp images"
arch=('x86_64' 'i686')
url="http://diybookscanner.org/forum/viewtopic.php?f=19&t=2589&start=10"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(ppmrose.zip::http://diybookscanner.org/forum/download/file.php?id=4390)
sha1sums=('49655e12b7d5886cb1d8b885a8cbdfecf2b759dd')


build() {
	cd "$srcdir/${pkgname}_v$pkgver"
	for f in *.cc; do
		g++ -c "$f"
	done
	g++ ppmunwarp.o ppmroselib.o -o ppmunwarp
	g++ ppmwhitebalance.o ppmroselib.o -o ppmwhitebalance
}

package() {
	cd "$srcdir/${pkgname}_v$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	find . -type f -executable -exec cp {} "$pkgdir/usr/bin/" \;
}

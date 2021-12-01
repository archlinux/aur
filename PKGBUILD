
pkgname=sollya
pkgver=7.0
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="https://gitlab.inria.fr/sollya/sollya/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'fplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
)

source=('git+https://gitlab.inria.fr/sollya/sollya.git#tag=sollya-7.0')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}


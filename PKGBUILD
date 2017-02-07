
pkgname=sollya
pkgver=6.0
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="http://sollya.gforge.inria.fr/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'libfplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
 )

source=(http://gforge.inria.fr/frs/download.php/file/36270/sollya-6.0.tar.gz)
md5sums=('302a23a6a67f06968e28f1a74a07c1f3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}


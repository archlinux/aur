
pkgname=sollya
pkgver=7.0
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="http://sollya.gforge.inria.fr/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'libfplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
 )

source=(http://gforge.inria.fr/frs/download.php/file/37749/sollya-7.0.tar.gz)
md5sums=('7634380e998f9653f4c0bbc38994aac3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}


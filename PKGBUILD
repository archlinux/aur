
pkgname=sollya
pkgver=4.1
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="http://sollya.gforge.inria.fr/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'libfplll' 'gnuplot')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
 )

source=(https://gforge.inria.fr/frs/download.php/33150/$pkgname-$pkgver.tar.bz2)
md5sums=('8bf144cb2fdcb8728226571f00310185')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}


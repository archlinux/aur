
pkgname=flopoco
pkgver=2.5.0
pkgrel=1

pkgdesc="A generator of arithmetic cores (Floating-Point Cores, but not only) for FPGAs (but not only)"
arch=('any')
url="http://flopoco.gforge.inria.fr/"
license=('custom')

depends=('mpfr' 'mpfi' 'sollya' 'libfplll' 'libxml2')
makedepends=('cmake' 'boost')

source=(https://gforge.inria.fr/frs/download.php/32591/flopoco-2.5.0.tgz)
md5sums=('a7908528a6bf0e90c372bbab14319d8a')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	install -D ./flopoco         $pkgdir/usr/bin/flopoco
	install -D ./bin2fp          $pkgdir/usr/bin/flopoco_bin2fp
	install -D ./fp2bin          $pkgdir/usr/bin/flopoco_fp2bin
	install -D ./fpadder_example $pkgdir/usr/bin/flopoco_fpadder_example
	install -D ./longacc2fp      $pkgdir/usr/bin/flopoco_longacc2fp

	install -D "./tools/FloPoCo Bash Completion/flopoco" $pkgdir/etc/bash_completion.d/flopoco
}


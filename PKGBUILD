# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lbrate
pkgver=1.1
pkgrel=2
pkgdesc="Extracts files from the CP/M LBR format"
arch=('i686' 'x86_64')
url="http://www.svgalib.org/rus/lbrate.html"
license=('GPL')
source=(ftp://ftp.ibiblio.org/pub/Linux/utils/compress/$pkgname-$pkgver.tar.gz)
md5sums=('fba13b13be15c65570ca6500f348a811')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man1 install
}

pkgname=kallisto
pkgver=0.42.2.1
pkgrel=2
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('51b9c71d614ed756953321518648849e')

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd build
	make install
}
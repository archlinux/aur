pkgname=kallisto
pkgver=0.43.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6f28562d3635bf3a6f6d5dfa3ab244f1')

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

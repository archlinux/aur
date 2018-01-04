pkgname=kallisto
pkgver=0.43.1
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('54fc9b70ca44e4633f02c962cbc59737')

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

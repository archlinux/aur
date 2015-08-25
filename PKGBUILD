pkgname=fastx-toolkit
pkgver=0.0.14
pkgrel=1
arch=(x86_64)
pkgdesc='collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing.'
url="https://github.com/agordon/fastx_toolkit"
source=("$url/archive/$pkgver.tar.gz")
makedepends=(libtool autoconf automake)
depends=(libgtextutils)
sha256sums=('af4f9fe59f8c91bdd2d735bdac1fd89f0549b2bc759313fe3b86948056aad1aa')

build() {
	cd "$srcdir/fastx_toolkit-$pkgver"
	
	./reconf
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/fastx_toolkit-$pkgver"
	make install
}
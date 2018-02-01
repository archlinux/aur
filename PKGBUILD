pkgname=hisat2
pkgver=2.1.0
pkgrel=1
pkgdesc='A fast and sensitive alignment program for mapping next-generation sequencing reads against genomes'
url="https://ccb.jhu.edu/software/$pkgname"
license=(GPLv3)
arch=(i686 x86_64)
source=("ftp://ftp.ccb.jhu.edu/pub/infphilo/$pkgname/downloads/$pkgname-$pkgver-source.zip")
sha256sums=('89a276eed1fc07414b1601947bc9466bdeb50e8f148ad42074186fe39a1ee781')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	for bin in hisat2 hisat2-*; do
		install -Dm755 $bin "$pkgdir/usr/bin/$bin"
	done
}

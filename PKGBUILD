pkgname=hisat2
pkgver=2.2.1
pkgrel=1
pkgdesc='A fast and sensitive alignment program for mapping next-generation sequencing reads against genomes'
url="https://ccb.jhu.edu/software/$pkgname"
license=(GPL3)
arch=(x86_64)
optdepends=('python: To use the wrapper scripts instead of -l and -s variants')
source=("$pkgname-$pkgver-source.zip::https://cloud.biohpc.swmed.edu/index.php/s/fE9QCsX3NH4QwBi/download")
sha256sums=('48e933330d4d8470d2b3dfe7ec3918f2e98a75f7381891e23b7df1fb4f135eb1')

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

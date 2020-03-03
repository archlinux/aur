pkgname=hisat2
pkgver=2.2.0
pkgrel=1
pkgdesc='A fast and sensitive alignment program for mapping next-generation sequencing reads against genomes'
url="https://ccb.jhu.edu/software/$pkgname"
license=(GPLv3)
arch=(x86_64)
source=("$pkgname-$pkgver-source.zip::https://cloud.biohpc.swmed.edu/index.php/s/$pkgname-${pkgver//./}-source/download")
sha256sums=('0dd55168853b82c1b085f79ed793dd029db163773f52272d7eb51b3b5e4a4cdd')

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

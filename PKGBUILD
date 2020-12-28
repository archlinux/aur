# Maintainer: Stefan Zanko <szanko at protonmail dot com>

pkgname=magicblast-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Ncbi Magic-BLAST is a tool for mapping large next-generation RNA or DNA sequencing runs against a whole genome or transcriptome.'
arch=('x86_64')
license=('custom:Public Domain')
url='https://ncbi.github.io/magicblast/'
conflicts=('magicblast')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/LATEST/ncbi-magicblast-${pkgver}-x64-linux.tar.gz")
md5sums=('2acfe2f6fd339f2d0ba4dc7571e3987d')

package() {
	cd "${srcdir}/ncbi-magicblast-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./bin/magicblast
	install -Dm755 -t "${pkgdir}/usr/bin" ./bin/makeblastdb
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
}

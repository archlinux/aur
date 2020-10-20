# Maintainer: Saulius Lukauskas < luksaulius @ gmail . com >

pkgname=pureclip
pkgver=1.3.1
pkgrel=1
pkgdesc="PureCLIP is a tool to detect protein-RNA interaction footprints from single-nucleotide CLIP-seq data"
arch=("any")
url="https://github.com/skrakau/PureCLIP"
license=('GPL3')
depends=('gsl' 'cmake')
source=("https://github.com/skrakau/PureCLIP/archive/v${pkgver}.tar.gz")
md5sums=('bbaa2945f15f5682b63e1a3682df3e89')

build() {
		cd PureCLIP-${pkgver}
		cmake src
		make
}

package() {
		install -d ${pkgdir}/usr/bin
		install -Dm755 ${srcdir}/PureCLIP-${pkgver}/pureclip ${pkgdir}/usr/bin
}

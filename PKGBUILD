# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

_pkgname=DESeq2
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc="Differential gene expression analysis based on the negative binomial distribution."
url="https://bioconductor.org/packages/DESeq2"
arch=("x86_64")
license=("LGPL3")
depends=('r'
         'r-s4vectors'
         'r-iranges'
         'r-genomicranges'
         'r-summarizedexperiment')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${pkgver}.tar.gz")
sha1sums=('d88e0911e5b9ab55345187cf34ee2d86b1651de6')

package() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"

    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" ./${_pkgname}
}

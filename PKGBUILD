# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

_pkgname=DESeq2
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=2
pkgdesc="Differential gene expression analysis based on the negative binomial distribution."
url="https://bioconductor.org/packages/DESeq2"
arch=("x86_64")
license=("LGPL3")
depends=('r'
         'r-s4vectors'
         'r-iranges'
         'r-genomicranges'
         'r-summarizedexperiment'
         'r-biobase'
         'r-biocgenerics'
         'r-biocparallel'
         'r-ggplot2'
         'r-locfit'
         'r-matrixstats'
         'r-rcpp')
makedepends=('r-rcpparmadillo')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${pkgver}.tar.gz")
sha256sums=('2af89dce722843a3824f9637419d98dae0052122b30e23b7fc811cca36d8e7d7')

package() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"

    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" ./${_pkgname}
}

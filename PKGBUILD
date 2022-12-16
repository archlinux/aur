# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

_pkgname=DESeq2
pkgname=r-${_pkgname,,}
pkgver=1.38.2
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
sha256sums=('640d38503045536b6bcbf8d19a28b1b53fffe199f2f6b5e6a9050e43d9f601d5')

package() {
    mkdir -p "$pkgdir/usr/lib/R/library"
    cd "$srcdir"

    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" ./${_pkgname}
}

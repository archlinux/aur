# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biostrings
_bcver=2.54.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Efficient manipulation of biological strings"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0' 'r-biocgenerics>=0.31.5' 'r-s4vectors>=0.21.13' r-iranges 'r-xvector>=0.23.2')
makedepends=(gcc)
optdepends=(r-rmpi r-bsgenome r-bsgenome.celegans.ucsc.ce2 r-bsgenome.dmelanogaster.ucsc.dm3 r-bsgenome.hsapiens.ucsc.hg18 r-drosophila2probe r-hgu95av2probe r-hgu133aprobe r-genomicfeatures r-hgu95av2cdf r-affy r-affydata r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('d7d799f0c8c9e5451171bd81e28ba3bb5b9838d3d5c8c62f954c74eaa078075f')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

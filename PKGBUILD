# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biostrings
_bcver=2.56.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Efficient manipulation of biological strings"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0' 'r-biocgenerics>=0.31.5' 'r-s4vectors>=0.25.14' 'r-iranges>=2.21.6' 'r-xvector>=0.27.2' r-crayon)
makedepends=(gcc)
optdepends=(r-bsgenome r-bsgenome.celegans.ucsc.ce2 r-bsgenome.dmelanogaster.ucsc.dm3 r-bsgenome.hsapiens.ucsc.hg18 r-drosophila2probe r-hgu95av2probe r-hgu133aprobe r-genomicfeatures r-hgu95av2cdf r-affy r-affydata r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('286e06883c4c230b696e89b06fba78ba418db15559def871a163a1d7ce77b046')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

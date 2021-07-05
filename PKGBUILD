# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDb
_bcver=1.28.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for manipulating chromosome names, including modifying them to follow a particular naming style"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-biocgenerics>=0.37.0' 'r-s4vectors>=0.25.12' 'r-iranges>=2.13.12' r-rcurl r-genomeinfodbdata)
optdepends=(r-genomicranges r-rsamtools r-genomicalignments r-genomicfeatures r-txdb.dmelanogaster.ucsc.dm3.ensgene r-bsgenome r-bsgenome.scerevisiae.ucsc.saccer2 r-bsgenome.celegans.ucsc.ce2 r-bsgenome.hsapiens.ncbi.grch38 r-runit r-biocstyle r-knitr)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('e8ea00259cd17dadbe145b88df7d98fea024acd19cb8ad1b4f9607796cf648bd')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=SummarizedExperiment
_bcver=1.17.5
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="SummarizedExperiment container"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.2' 'r-genomicranges>=1.33.6' r-biobase 'r-delayedarray>=0.3.20' 'r-biocgenerics>=0.15.3' 'r-s4vectors>=0.25.14' 'r-iranges>=2.21.6' 'r-genomeinfodb>=1.13.1')
optdepends=(r-annotate r-annotationdbi r-hgu95av2.db r-genomicfeatures r-txdb.hsapiens.ucsc.hg19.knowngene r-biocstyle r-knitr r-rmarkdown r-digest r-jsonlite r-rhdf5 r-hdf5array r-airway r-runit r-testthat)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('cbb988dfff5bd1ce6b046d1183cac09c')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

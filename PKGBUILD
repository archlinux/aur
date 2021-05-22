# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.18.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="A unified framework for working transparently with on-disk and in-memory array-like datasets"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-biocgenerics>=0.37.0' 'r-matrixgenerics>=1.1.3' 'r-s4vectors>=0.27.2' 'r-iranges>=2.17.3')
optdepends=(r-biocparallel r-hdf5array r-genefilter r-summarizedexperiment r-airway r-pryr r-delayedmatrixstats r-knitr r-biocstyle r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('59e2f53c97ccac0f74015bbb50ba576da4afec615b1a9df0b6ece3268c10c370')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.14.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="A unified framework for working transparently with on-disk and in-memory array-like datasets"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.4' r-matrixstats 'r-biocgenerics>=0.31.5' 'r-s4vectors>=0.25.15' 'r-iranges>=2.17.3')
makedepends=(gcc)
optdepends=(r-biocparallel r-hdf5array r-genefilter r-summarizedexperiment r-airway r-pryr r-delayedmatrixstats r-knitr r-biocstyle r-runit)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('cc0b2f8c7ff4e9d596c169decf244a23')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

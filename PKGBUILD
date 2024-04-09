# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.40.2
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of vector-like and list-like containers in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/${_bcname}"
license=(Artistic2.0)
depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
)
optdepends=(
    "r-biocstyle"
    "r-data.table"
    "r-delayedarray"
    "r-genomicranges"
    "r-graph"
    "r-iranges"
    "r-knitr"
    "r-matrix"
    "r-runit"
    "r-shortread"
    "r-summarizedexperiment"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("51b67bb4d3832fecb2d5eaee90baa93c5f13fe1ecc4eea5416db9c8735deeb53bf9d33f677943e25cc2b337fc184b335c274d08863f30e2d7057429034214a9c")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

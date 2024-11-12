# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.44.0
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
b2sums=("3181a57e6c06f9b634267b3864ddade902e7160eddf0d5f5fa0fc9583c22e28c4b4daeba5195759ed5f5cb86ed630b2c8633c259ab04c2f83930eb7296a8833d")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.38.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=2
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
    "r-runit"
    "r-shortread"
    "r-summarizedexperiment"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("6058f754fe594e2bdc11a5414c6d135037ea4918008f1b9eb99a0009b9237226528eb01b43cfe8da639d288c8c02bc094fd19f0c619c60bd035cdd2b34539dda")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

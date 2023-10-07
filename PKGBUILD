# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.38.2
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
    "r-runit"
    "r-shortread"
    "r-summarizedexperiment"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("5adbe9f7a21e34964efb46b766357c36df4c030378fbfbbea880760eb591471c268e0eb5e94a4d5838e8514b2201212f02a32ff43cce872f401719487fda0cc1")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

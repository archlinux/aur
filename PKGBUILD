# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.36.2
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
    "r-matrix"
    "r-runit"
    "r-shortread"
    "r-summarizedexperiment"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('31d38a7dbf8fffb25b5197a52b2d29d673edbc5a3cd347ebf1fb614f1f39bf7af1228516cb5e0494679ed28c3b9448c1f9b4a4b14fba41ed499a0dbe89e98e08')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

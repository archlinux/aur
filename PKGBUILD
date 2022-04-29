# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=S4Vectors
_bcver=0.34.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of vector-like and list-like containers in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/${_bcname}"
license=(Artistic-2.0)
depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
)
optdepends=(
	r-biocstyle
	r-data.table
	r-delayedarray
	r-genomicranges
    r-graph
    r-iranges
	r-runit
	r-shortread
	r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=("9368ef6636862f02a7cca0022b94975a21a1a4ac434f7b44411c52d83e5c7e48")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

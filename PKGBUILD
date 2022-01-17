# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDbData
_bcver=1.2.7
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
arch=(any)
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0')
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('217cbad0dd3ed8f0da6b21c7d35df5737bcbd21e317ca71d2fb6ec4c316b1987')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

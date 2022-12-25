# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UniProt.ws
_pkgver=2.38.1
pkgname=r-${_pkgname,,}
pkgver=2.38.1
pkgrel=1
pkgdesc='R Interface to UniProt Web Services'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocbaseutils
  r-biocfilecache
  r-biocgenerics
  r-httpcache
  r-httr
  r-jsonlite
  r-progress
  r-rjsoncons
  r-rsqlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d6d4d6cbf162fb1824dd06d3e1e2e3d3f64408ffdd2f0b24e5480d909ffac2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

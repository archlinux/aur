# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oppar
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Outlier profile and pathway analysis in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gseabase
  r-gsva
)
optdepends=(
  r-go.db
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-parallel
  r-rmarkdown
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e296c1fe2803bd68f7d0dc2529fb2e55f5ec5a6226a63be2895b723ad983d028')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oppar
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
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
sha256sums=('732bcdf1cf284ee8b051a9ad29473e15f1af65f066c5926a9e4d82ac4702be38')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

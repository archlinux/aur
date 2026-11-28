# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oppar
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('6baa5c506f755e6365437d55b8472704d74d6a2be3d2677c65506b92a9b98039')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

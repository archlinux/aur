# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oppar
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
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
sha256sums=('780845dd03116aa20c8ea4ff031807477b525f2a596ff4e686a3f844d15fdd2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

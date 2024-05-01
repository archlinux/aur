# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWAS.BAYES
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='GWAS for Selfing Species'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-ga
  r-limma
  r-memoise
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-rmarkdown
  r-rrblup
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('330ef0eb2bab8f1da099cc7997bd7eeae7d41403fa8ace82492acdd6320fd715')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocthis
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=1.10.3
pkgrel=1
pkgdesc='Automate package and project setup for Bioconductor packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-fs
  r-glue
  r-rlang
  r-styler
  r-usethis
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-pkgdown
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a4e3d2b0352317bb0c943ad6ebc97c2c81635655f844340b7a2bd0dfaecf18ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

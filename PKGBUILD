# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodb
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='biodb, a library and a development framework for connecting to chemical and biological databases'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-biocfilecache
  r-chk
  r-jsonlite
  r-lgr
  r-lifecycle
  r-openssl
  r-plyr
  r-progress
  r-r6
  r-rappdirs
  r-rcpp
  r-rcurl
  r-rsqlite
  r-stringr
  r-testthat
  r-withr
  r-xml
  r-yaml
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-git2r
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b394a2bea684f3c406cbdb5564893dc289ad995716cf8cf13d0c66e57ec092d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

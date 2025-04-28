# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebook
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Re-using Content in Bioconductor Books'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocstyle
  r-codedepends
  r-dir.expiry
  r-filelock
  r-knitr
  r-rmarkdown
)
optdepends=(
  r-biocmanager
  r-biocparallel
  r-bookdown
  r-igraph
  r-osca.intro
  r-osca.workflows
  r-rappdirs
  r-rcurl
  r-testthat
  r-xml
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f97aef6d142534e518ff9f61faf2d891fc234ca8d228a2cfab0f2e2438f63f76')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebook
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
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
sha256sums=('6f1dbeef794b22e2a9e27b3d48da31fb75b262bfa43aa5d6358059dc38a00f0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

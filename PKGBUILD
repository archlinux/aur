# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebook
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('d35a38f8ef914fca9f731d05f13728e4d4ab011d7278bfc8a6f00a8350e6a96c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

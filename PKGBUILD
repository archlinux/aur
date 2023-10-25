# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocStyle
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='Standard styles for vignettes and other Bioconductor documents'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-bookdown
  r-knitr
  r-rmarkdown
  r-yaml
)
optdepends=(
  r-biocgenerics
  r-htmltools
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9cbae3a879d4ed1e3692111d802193d8facf0a89e0bffa6de05718bb476cf39e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocStyle
_pkgver=2.32.1
pkgname=r-${_pkgname,,}
pkgver=2.32.1
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
sha256sums=('79ceb7377b7fa27ad4f9c7de99034682c89e44afa857730a37e22052aab016d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

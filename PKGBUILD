# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interactiveDisplayBase
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Base package for enabling powerful shiny web displays of Bioconductor objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-dt
  r-shiny
)
optdepends=(
  r-knitr
  r-markdown
  r-rstudioapi
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5cf685f42230bc3e9d38ac9231ac466bf10f374635f6a31d98c4a34b31489c91')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

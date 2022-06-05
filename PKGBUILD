# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocStyle
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
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
sha256sums=('459527c4b14b003f9446f13ec7518b76032a4bc612c398420f38ad00c48a91db')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

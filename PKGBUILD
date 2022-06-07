# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGalaxy
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=4
pkgdesc='Make an R function available in the Galaxy web platform'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/RGalaxy.html"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-optparse
  r-roxygen2
  r-xml
)
optdepends=(
  r-annotationdbi
  r-formatr
  r-hgu95av2.db
  r-knitr
  r-markdown
  r-rsclient
  r-rserve
  r-runit
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad7a8b0e466f1c07443de1b73e2a3de4845af92be8e3a0322a16b12219b2da6d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

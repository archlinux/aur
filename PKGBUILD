# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VarfromPDB
_pkgver=2.2.10
pkgname=r-${_pkgname,,}
pkgver=2.2.10
pkgrel=4
pkgdesc='Disease-Gene-Variant Relations Mining from the Public Databases and Literature'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-rismed
  r-stringi
  r-stringr
  r-xml
  r-xml2r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ec303962a16317769d06e70482435af5127796897659208c1d52f305acf14826')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

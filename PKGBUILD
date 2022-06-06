# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RISmed
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=2.3.0
pkgrel=4
pkgdesc='Download Content from NCBI Databases'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-httr
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bd191bde3868c80d017caf2af7ccdf38763f892e94b68cd2e28a7f81f42f16e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

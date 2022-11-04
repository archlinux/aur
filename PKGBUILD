# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.datetimes
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=1
pkgdesc="Date and Time Extensions for the 'rebus' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-rebus.base
)
optdepends=(
  r-stats
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aec17d24978bebb9f88b96940fe5fa359f8342e8312d66679d317eb443ae05c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

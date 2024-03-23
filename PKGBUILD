# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_pkgname=servr
_pkgver=0.30
pkgname=r-${_pkgname,,}
pkgver=0.30
pkgrel=1
pkgdesc='A Simple HTTP Server to Serve Static Files or Dynamic Documents'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-httpuv
  r-jsonlite
  r-mime
  r-xfun
)
optdepends=(
  r-knitr
  r-later
  r-rmarkdown
  r-rstudioapi
  r-tools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43f920161408871a042462b7c3353149a608941253541a19a9ce3408f9882d40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

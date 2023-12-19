# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_pkgname=servr
_pkgver=0.28
pkgname=r-${_pkgname,,}
pkgver=0.28
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
sha256sums=('463c1371e1c2433c2d59dc3008cb377e75793b7bef3a7f6498204f419532d482')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

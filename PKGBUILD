# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tagcloud
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=0.7.0
pkgrel=1
pkgdesc='Tag Clouds'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcolorbrewer
  r-rcpp
)
optdepends=(
  r-extrafont
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c067ac327944e230f605feb396e05481c142e2a0688b540dd04e2c1cedb8f29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

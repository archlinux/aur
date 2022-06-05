# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatMA
_pkgver=0.3.14
pkgname=r-${_pkgname,,}
pkgver=0.3.14
pkgrel=4
pkgdesc='Tools to Deal with Raster Maps'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-filehash
  r-sp
)
optdepends=(
  r-maptools
  r-mass
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e22a35b34836030871c212286765791d2b1d56befac325a05075f0e5e7ad851')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

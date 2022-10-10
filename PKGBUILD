# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rainbow
_pkgver=3.7
pkgname=r-${_pkgname,,}
pkgver=3.7
pkgrel=1
pkgdesc='Bagplots, Boxplots and Rainbow Plots for Functional Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-hdrcde
  r-ks
  r-pcapp
)
optdepends=(
  r-forecast
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('159dd90555eee237397f042d811f773aaee779f5036c4e0669a52c36e28d8db2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

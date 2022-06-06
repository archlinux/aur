# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rpart.plot
_pkgver=3.1.1
pkgname=r-${_pkgname,,}
pkgver=3.1.1
pkgrel=3
pkgdesc="Plot 'rpart' Models: An Enhanced Version of 'plot.rpart'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-earth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('30736240058df21a96d10912a091d938f821d521a3bc4efb9aa4ef6fb233024d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

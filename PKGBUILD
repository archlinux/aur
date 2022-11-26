# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reldist
_pkgver=1.7-1
pkgname=r-${_pkgname,,}
pkgver=1.7.1
pkgrel=6
pkgdesc='Relative Distribution Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-densestbayes
)
optdepends=(
  r-locfit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2693ab9660e34a3f5e27bf8eec985f7f8dcd625df14779367c93557c15c66b9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

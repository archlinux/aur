# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSA
_pkgver=1.03.2
pkgname=r-${_pkgname,,}
pkgver=1.03.2
pkgrel=3
pkgdesc='Gene Set Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-impute
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('177d6059fc645d3d8883806d2dea1c5dfc68efdada9aadde8a96b6d57acf35b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

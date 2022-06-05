# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=colorRamps
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=2.3.1
pkgrel=1
pkgdesc='Builds color tables'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('61f1290824380ae2fe4649f296649e0a155b73ced41479686150400f8a9c568a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

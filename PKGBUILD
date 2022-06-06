# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randomcoloR
_pkgver=1.1.0.1
pkgname=r-${_pkgname,,}
pkgver=1.1.0.1
pkgrel=1
pkgdesc='Generate Attractive Random Colors'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC0')
depends=(
  r
  r-colorspace
  r-rtsne
  r-scales
  r-stringr
  r-v8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cbae51a47a92b2cc3d5ab48877818404429fb73fc795430ec622a8dff20f1067')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

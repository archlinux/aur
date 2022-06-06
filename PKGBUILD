# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap.datasets
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=0.0.5
pkgrel=3
pkgdesc="Datasets for 'gap'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2299b52efee322ce0eaf66c66ae440f46618b647701cd741568c08bdc3111c9c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

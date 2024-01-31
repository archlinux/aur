# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magicaxis
_pkgver=2.4.5
pkgname=r-${_pkgname,,}
pkgver=2.4.5
pkgrel=1
pkgdesc='Pretty Scientific Plotting with Minor-Tick and Log Minor-Tick Support'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-celestial
  r-mapproj
  r-plotrix
  r-rann
  r-sm
)
optdepends=(
  r-fst
  r-imager
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d4802502a6fb2feafb3d9cbd7fa48e2d2de68a7f3eca3436b96d642c6039213')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

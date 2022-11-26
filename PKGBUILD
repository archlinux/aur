# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magicaxis
_pkgver=2.2.14
pkgname=r-${_pkgname,,}
pkgver=2.2.14
pkgrel=7
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
sha256sums=('fb2cb62ec40bff1d4dddd86476e3a29332409471ee82d8ba3aae4a6cec8e16bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

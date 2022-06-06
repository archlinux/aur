# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrgMassSpecR
_pkgver=0.5-3
pkgname=r-${_pkgname,,}
pkgver=0.5.3
pkgrel=4
pkgdesc='Organic Mass Spectrometry'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-knitr
  r-lattice
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88f9dd92969a0e9cb5c5bc0abd67143f8f1dbb75f01bc13cf4d8b5b0326aa9b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

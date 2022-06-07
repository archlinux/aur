# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alsace
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=4
pkgdesc='ALS for the Automatic Chemical Exploration of mixtures'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/${_pkgname}.html"
license=('GPL')
depends=(
  r
  r-als
  r-ptw
)
optdepends=(
  r-knitr
  r-lattice
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f63765eb8e61520ec7c5a0e238333fbc80d077b6a744a881f45ad0f188c94d9d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affylmGUI
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=1.88.0
pkgrel=1
pkgdesc='GUI for limma Package with Affymetrix Microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-affyio
  r-affyplm
  r-annotationdbi
  r-biocgenerics
  r-biocmanager
  r-gcrma
  r-limma
  r-r2html
  r-tkrplot
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfeb60744ce4f65ab335d42b086df4bd5a3b00472762ecdfcd3d66f839fafc7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

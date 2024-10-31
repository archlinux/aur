# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPIA
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=2.58.0
pkgrel=1
pkgdesc='Signaling Pathway Impact Analysis (SPIA) using combined evidence of pathway over-representation and unusual signaling perturbations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-kegggraph
)
optdepends=(
  r-graph
  r-hgu133plus2.db
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7edaf29658f5b4240495b6d4079be23b7c3e80daf5ddffa5dd5a6785f2d45194')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

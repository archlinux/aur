# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathRender
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=3
pkgdesc='Render molecular pathways'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-cmap
  r-graph
  r-rcolorbrewer
  r-rgraphviz
)
optdepends=(
  r-all
  r-hgu95av2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cec0bfa2a9d1c5037f0f1a2f1c8339cf1368ce81b4e9be8ef48ad42f5921e621')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

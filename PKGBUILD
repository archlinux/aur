# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MLP
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Mean Log P Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-gplots
)
optdepends=(
  r-annotate
  r-go.db
  r-gostats
  r-graph
  r-keggrest
  r-limma
  r-mouse4302.db
  r-org.cf.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.mmu.eg.db
  r-org.rn.eg.db
  r-reactome.db
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf863eb001fd234d2c9af99f26fef3e35d1f0de85d12ddee0b9743e73c2b136b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

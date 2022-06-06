# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metaMA
_pkgver=3.1.3
pkgname=r-${_pkgname,,}
pkgver=3.1.3
pkgrel=3
pkgdesc='Meta-analysis for MicroArrays'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-smvar
)
optdepends=(
  r-annaffy
  r-geoquery
  r-hgu133a.db
  r-hgu133plus2.db
  r-hgu95av2.db
  r-org.hs.eg.db
  r-venndiagram
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a0c0351b83419984095cb2c1d77d222d1cdb7158dd8c80fc384bf175ab9358e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mygene
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Access MyGene.Info_ services'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomicfeatures
  r-hmisc
  r-httr
  r-jsonlite
  r-plyr
  r-s4vectors
  r-sqldf
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e6b042db74d14dc0eaa52127fb491246ada01cfcc4fe3aaa15c7458d2e72c48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

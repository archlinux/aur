# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4
_pkgver=1.50.1
pkgname=r-${_pkgname,,}
pkgver=1.50.1
pkgrel=1
pkgdesc='Automated Affymetrix Array Analysis Umbrella Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-a4base
  r-a4classif
  r-a4core
  r-a4preproc
  r-a4reporting
)
optdepends=(
  r-all
  r-cairo
  r-gostats
  r-mlp
  r-nlcv
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1937262f0d5281f71d21a9d7cf74a5df4668fc76c15e611dac51a87a6cd52b6a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=illuminaio
_pkgver=0.38.0
pkgname=r-${_pkgname,,}
pkgver=0.38.0
pkgrel=1
pkgdesc='Parsing Illumina Microarray Output Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-illuminadatatestfiles
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c240646e8cfe38456c7e223da4edaf8e4526678d887b896247fa129ed42960f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

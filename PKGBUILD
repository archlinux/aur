# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ABSSeq
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='ABSSeq: a new RNA-Seq analysis method based on modelling absolute expression differences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-locfit
)
optdepends=(
  r-edger
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2803497c2c64222dae354204a064dcb23d055a4a8c6998a2af182052df6fd385')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

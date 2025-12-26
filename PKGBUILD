# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PREDA
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Position Related Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-biobase
  r-lokern
  r-multtest
)
optdepends=(
  r-affy
  r-catools
  r-limma
  r-predasampledata
  r-quantsmooth
  r-qvalue
  r-rmpi
  r-rsprng
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a10adcac1ac8288a865319d18663753dfe97999b58ee9891e3375c0e898624fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

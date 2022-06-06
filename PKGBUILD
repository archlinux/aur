# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiOmicsViz
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Plot the effect of one omics data on other omics data along the chromosome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('265c847461e3bfd4e6960eab9bd3bf671ba36729b80d841589ac8ca4aa187f31')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

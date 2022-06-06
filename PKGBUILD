# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowFP
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Fingerprinting for Flow Cytometry'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-flowcore
  r-flowviz
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba12d5bd4dc784997f30435314fe61f86b0c28d99c4458f7e8f9b76daa54b442')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

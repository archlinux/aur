# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RnBeads.hg19
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='RnBeads.hg19'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1423b50568825c8e09db8ebe018766bd5c2e601e65a75370044c9babbabec9c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

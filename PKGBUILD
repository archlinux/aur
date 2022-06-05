# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome.Ecoli.NCBI.20080805
_pkgver=1.3.1000
pkgname=r-${_pkgname,,}
pkgver=1.3.1000
pkgrel=4
pkgdesc='Escherichia coli full genomes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4740ebd81b56e9a990e7bbf3eb799011346db8af4a2615572558cda0bd97f5d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

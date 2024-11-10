# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=traseR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='GWAS trait-associated SNP enrichment analyses in genomic intervals'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomicranges
  r-iranges
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('757aa47f1f88d49be3d03b412559bdf62b8c30df924a381b6b906b7480cd75b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

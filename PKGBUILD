# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BSgenome.Hsapiens.NCBI.GRCh38
_pkgver=1.3.1000
pkgname=r-${_pkgname,,}
pkgver=1.3.1000
pkgrel=4
pkgdesc='Full genome sequences for Homo sapiens (GRCh38)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('812538bdacfd0eb90714916203dec85b22de2a5f7aaf0d0431d0a15370c3e578')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

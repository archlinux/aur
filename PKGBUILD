# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Homo.sapiens
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=3
pkgdesc='Annotation package for the Homo.sapiens object'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-genomicfeatures
  r-go.db
  r-org.hs.eg.db
  r-organismdbi
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('014809fc6ef6410be8dc1094c9cb083719f20d999065ae4bf388855be0913b94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

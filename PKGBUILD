# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=attract
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc="Methods to Find the Gene Expression Modules that Represent the Drivers of Kauffman's Attractor Landscape"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-gostats
  r-keggrest
  r-limma
  r-org.hs.eg.db
  r-reactome.db
)
optdepends=(
  r-illuminahumanv1.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e36bc3233f8241ad46a5370684c6f9a4215ee681ce6c7404fa02b952fbb566d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTqPCR
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Automated analysis of high-throughput qPCR data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-biobase
  r-gplots
  r-limma
  r-rcolorbrewer
)
optdepends=(
  r-statmod
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79d6092d24a296d91f60ca88757e9aa7158a6e0154acce8bbbb5e65f4c2ae2b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

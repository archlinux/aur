# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSRI
_pkgver=2.54.0
pkgname=r-${_pkgname,,}
pkgver=2.54.0
pkgrel=1
pkgdesc='Gene Set Regulation Index'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-fdrtool
  r-genefilter
  r-gseabase
  r-les
)
optdepends=(
  r-hgu95av2.db
  r-limma
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bc0f8278715130561ec0fbdf560e901eb5b279ecb84ced8ce3fae11976e500d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

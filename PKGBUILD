# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSRI
_pkgver=2.48.0
pkgname=r-${_pkgname,,}
pkgver=2.48.0
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
sha256sums=('38e62e62b0462371d4586c1dab1a3c54ee5185b4871449aaa35e6671982b4d1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

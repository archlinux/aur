# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KCsmart
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=2.58.0
pkgrel=1
pkgdesc='Multi sample aCGH analysis package using kernel convolution'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-multtest
  r-siggenes
)
optdepends=(
  r-biobase
  r-cghbase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abd9c549f8a8a3d5fe0938831705b082e55dcefa91a8c560b091f3d3ddc1676b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

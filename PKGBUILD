# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CatEncoders
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=4
pkgdesc='Encoders for Categorical Variables'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74a66c700f65da394742cdc58a39e20b9175bba6aa98857cfa88296a00fe3ce1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

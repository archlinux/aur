# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agricolae
_pkgver=1.3-6
pkgname=r-${_pkgname,,}
pkgver=1.3.6
pkgrel=1
pkgdesc='Statistical Procedures for Agricultural Research'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-algdesign
  r-klar
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c56f1b6f6dabd03d722bcccdca94d8c80badfb82e5600464be0164116325db4a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

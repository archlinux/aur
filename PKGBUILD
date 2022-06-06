# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly.en
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=4
pkgdesc="Language Support for 'sylly' Package: English"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sylly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('23d166feda7177f6204c607da7122d5bbdcf53bc6c5f36f5d95b9c602346844b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

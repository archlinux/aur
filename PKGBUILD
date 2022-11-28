# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spd
_pkgver=2.0-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Semi Parametric Distribution'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1545e10842a974a56585567f06b369d45108136db138c9a60c661d123381fd03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

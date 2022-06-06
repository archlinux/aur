# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=koRpus.lang.en
_pkgver=0.1-4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=4
pkgdesc="Language Support for 'koRpus' Package: English"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-korpus
  r-sylly.en
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('629cfc278a2d9aa28cb31323bc5f0077322273aefff8532232ea48c98b0152b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

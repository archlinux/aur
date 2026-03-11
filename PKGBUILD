# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=cyclocomp
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=1
pkgdesc='Cyclomatic Complexity of R Code'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-callr
  r-crayon
  r-desc
  r-remotes
  r-withr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e364dcacbdce4a4675eaeb2021a04c03913970e57c2a1d6185c87fdf58ed783')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

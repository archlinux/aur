# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=configr
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=0.3.5
pkgrel=1
pkgdesc='An Implementation of Parsing and Writing Configuration File (JSON/INI/YAML/TOML)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-glue
  r-ini
  r-jsonlite
  r-rcpptoml
  r-stringr
  r-yaml
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43a19fa4920f2265ac4b2e03de36c5e135d1c97dfdc1fecee0b061ee92fa8ee2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

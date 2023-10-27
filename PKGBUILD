# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyscreenshot
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=3
pkgdesc="Capture Screenshots of Entire Pages or Parts of Pages in 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-base64enc
  r-htmltools
  r-jsonlite
  r-shiny
  r-uuid
)
optdepends=(
  r-timevis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08f54b8e8b3fcc73f451d0e113454f1b237a97fee7484f9f60ba69e8017341dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

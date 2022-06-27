# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gptk
_pkgver=1.08
pkgname=r-${_pkgname,,}
pkgver=1.08
pkgrel=5
pkgdesc='Gaussian Processes Tool-Kit'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-fields
)
optdepends=(
  r-spam
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4a84b4e275be4aea5e245748a16ede47cef28f7dc2d26acf0245a871c62663a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=googlePolylines
_cranver=0.8.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Encodes simple feature ('sf') objects and coordinates, and decodes polylines using the 'Google' polyline encoding algorithm"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-rcpp
    r-bh
)
makedepends=(gcc)
optdepends=(
    r-covr
    r-knitr
    r-rmarkdown
    r-testthat
    r-sf
    r-sfheaders
    r-testthat
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('38e79a69e263a86fd143efa283fb9515f46dbb85cd4d11a314cf6ceb187b31e3')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

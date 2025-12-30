# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=otelsdk
_cranver=0.2.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'OpenTelemetry' is a collection of tools, 'APIs', and 'SDKs' used to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) for analysis in order to understand your software's performance and behavior. "
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-otel
    r-utils
)
makedepends=(gcc)
optdepends=(
    r-callr
    r-cli
    r-curl
    r-gh
    r-jsonlite
    r-processx
    r-ps
    r-spelling
    r-testthat
    r-webfakes
    r-withr
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('51ba34bb853666c773258a203d0afcbd00c6be86f3100e1cb6230f2532c8c7fd')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

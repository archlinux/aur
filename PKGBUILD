# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=table1
_cranver=1.4.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tables of Descriptive Statistics in HTML"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-3')
depends=(
    'r>=3.5.0'
    'r-formula'
    'r-knitr'
    'r-htmltools'
    'r-yaml'
)
optdepends=(
    'r-matchit'
    'r-rmarkdown'
    'r-printr'
    'r-kableextra'
    'r-flextable'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('64c18c98ffc782ac4ed760e535a4634780679447e0fb25b931d3256ea42d88b3')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

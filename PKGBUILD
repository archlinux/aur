# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=table1
_cranver=1.4.3
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
sha512sums=('aa9c8c12b91add04f54898dbd0314e707b760c146a7a769e893ea9c25920120f67e7fb15b65d1e00e28572035b37afcd7f320e34cd7f233f164cbf169c9bf913')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

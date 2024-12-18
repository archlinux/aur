# Maintainer: ikyope at outlook dot com
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=classInt
_pkgver=0.4-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Choose Univariate Class Intervals"
arch=("x86_64")
url="https://CRAN.R-project.org/package=${_pkgname}"
license=("GPL-2.0-only OR GPL-3.0-only")
depends=(
    "r>=2.2"
    "r-grdevices"
    "r-stats"
    "r-graphics"
    "r-e1071"
    "r-class"
    "r-kernsmooth"
)
optdepends=(
    "r-spdata>=0.2.6.2"
    "r-units"
    "r-knitr"
    "r-rmarkdown"
    "r-tinytest"
)
makedepends=("gcc-fortran")
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=("394f51e137ac8451bdfb0def0662206545d28d487bf77609fc4e0cd7966960d1430c3ecbdd02c08ca7b757083fb62330dd4f598623860eaeba36b5a6d45ad7ad")

build() {
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

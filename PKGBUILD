# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Thomas Ivesdal-Tronstad <thotro at lyse dot net>
_cranname=pracma
_cranver=2.3.8
pkgname=r-pracma
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides a large number of functions."
url="https://cran.r-project.org/package=pracma"
arch=("any")
license=('GPL-2' 'GPL-3')
depends=('r>=3.1.0')
optdepends=()
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("67592275a802fd056e4a81311adce7ea86fa0d0787aeb3764580a3df3f2eac5df3c7e15c9f5dea9d00bbc3c9248e267ed346f4ef5d31979db2fbf93f6b2e6821")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"

    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


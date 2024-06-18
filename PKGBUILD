# Maintainer: Adam Schadler <ajschadler@gmail.com>

_cranname=phia
_cranver=0.3-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Analysis of model terms based on multiple comparisons of factor contrasts."
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-or-later")
depends=("r" "r-car")
optdepends=("r-lme4")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('5f341001bce60fab53f5051fdaf0781a47a829637441e7bf4d6df0d9ca460225015c5cd428fcfc5bcedad59bb393b15460b93fa6d0eb9f7a339d7f7d250939e7')

build() {
    R CMD INSTALL "${_cranname}_${_cranver}.tar.gz" -l "${srcdir}"
}

# Testing requires optional packages...
#check () {
#    R CMD check --no-vignettes --no-manual -l "${srcdir}" "${_cranname}_${_cranver}.tar.gz"
#}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"

    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

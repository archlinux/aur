# Maintainer: Adam Schadler <ajschadler@gmail.com>

_cranname=paran
_cranver=1.5.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Implementation of Horns technique for evaluating components retained in PCA or FA."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-2.0-only")
depends=(r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('82c854c5b1638cbd29afd6afa1167948f15490fc3d15ed6f4d63a25a9c377bf88736b63bf9e05ae3d516edb921a005630f2e7883be0a42c43c3f19bba5bdeffc')

build() {
    R CMD INSTALL "${_cranname}_${_cranver}.tar.gz" -l "${srcdir}"
}

#check () {
#    R CMD check --no-manual -l "${srcdir}" "${_cranname}_${_cranver}.tar.gz"
#}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"

    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

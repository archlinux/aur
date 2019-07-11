# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=ellipsis
_cranver=0.2.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-ellipsis
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Working with ..."
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.1' 'r-rlang>=0.3.0')
makedepends=()
optdepends=('r-covr' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('99d578acec7d8bdf2f43e502951d32ee')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}

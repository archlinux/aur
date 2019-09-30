# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=dotCall64
_cranver=1.0-0
pkgname=r-dotcall64
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Enhanced Foreign Function Interface Supporting Long Vectors"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r')
optdepends=('r-microbenchmark' 'r-openmpcontroller' 'r-rcolorbrewer' 'r-roxygen2' 'r-spam' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('bf49af415a0c2bf6899be3cdbaa21e1f')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}

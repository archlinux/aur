# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>


_cranname=MatrixModels
_cranver=0.4-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-matrixmodels
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Modelling with Sparse And Dense Matrices"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3')
depends=('r>=3.0.1' )

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('65b3ab56650c62bf1046a3eb1f1e19a0')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}
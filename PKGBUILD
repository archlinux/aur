# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=dimRed
_cranver=0.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-dimred
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Framework for Dimensionality Reduction"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r' 'r-drr')

optdepends=('r-rann' 'r-rspectra' 'r-rtsne' 'r-coranking' 'r-diffusionmap' 'r-energy' 'r-fastica' 'r-ggplot2' 'r-igraph' 'r-kernlab' 'r-lle' 'r-loe' 'r-optimx' 'r-pcapp' 'r-rgl' 'r-scales' 'r-scatterplot3d' 'r-testthat' 'r-tidyr' 'r-vegan')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0f8818edd6a9b663ddf5d1e6a28dd8bc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


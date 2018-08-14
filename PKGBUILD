# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.9-27
pkgname=r-kernlab
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Kernel-Based Machine Learning Lab'
arch=('x86_64')
url='https://cran.r-project.org/package=kernlab'
license=('GPL2')
depends=('r' )
source=("https://cran.r-project.org/src/contrib/kernlab_"$_cranver".tar.gz")
md5sums=('2a45749a0ae27126682bd1baa18b85f1')

build(){
    R CMD INSTALL kernlab_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership kernlab "$pkgdir"/usr/lib/R/library
}


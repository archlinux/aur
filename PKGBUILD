# Maintainer: getzze <getzze@gmail.com>
_cranver=1.0-15.1
pkgname=r-mco
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Multiple Criteria Optimization Algorithms and Related Functions'
arch=('x86_64')
url='https://cran.r-project.org/package=mco'
license=('GPL2')
depends=('r' 'r-cli')
source=("https://cran.r-project.org/src/contrib/mco_"$_cranver".tar.gz")
sha256sums=('3c13ebc8c1f1bfa18f3f95b3998c57fde5259876e92456b6c6d4c59bef07c193')

build(){
    R CMD INSTALL mco_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership mco "$pkgdir"/usr/lib/R/library
}


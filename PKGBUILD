# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>
_cranver=1.15.6
pkgname=r-mco
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Multiple Criteria Optimization Algorithms and Related Functions'
arch=('x86_64')
url='https://cran.r-project.org/package=mco'
license=('GPL2')
depends=('r' 'r-cli')
source=("https://cran.r-project.org/src/contrib/mco_"$_cranver".tar.gz")
sha512sums=("12f627fb02bf4cf6f00747491f84d3387061bd668c1bd7a5b72cf222a519240327f045750b2283b7baf44d40d4da98085c38f910f77c56c263dd28627acedbe6")

build(){
    R CMD INSTALL mco_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership mco "$pkgdir"/usr/lib/R/library
}


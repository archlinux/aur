# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.23-4
pkgname=r-ttr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Technical Trading Rules'
arch=('x86_64')
url='https://cran.r-project.org/package=TTR'
license=('GPL2')
depends=('r' 'r-xts>=0.10.0' 'r-zoo' 'r-curl')
optdepends=('r-runit')
makedepends=('gcc-fortran')
source=("https://cran.r-project.org/src/contrib/TTR_"$_cranver".tar.gz")
md5sums=('fa8873454a7d9b75ff4040421d4a42a6')

build(){
    R CMD INSTALL TTR_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership TTR "$pkgdir"/usr/lib/R/library
}


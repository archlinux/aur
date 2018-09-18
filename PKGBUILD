# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=1.2.6
pkgname=r-fs
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Cross-Platform File System Operations Based on libuv'
arch=('x86_64')
url='https://cran.r-project.org/package=fs'
license=('GPL3')
depends=('r' 'r-rcpp')
optdepends=('r-testthat' 'r-covr' 'r-pillar' 'r-crayon' 'r-withr')
source=("https://cran.r-project.org/src/contrib/fs_"$_cranver".tar.gz")
md5sums=('c0569bf79573d09daedfb363e17f4a78')

build(){
    R CMD INSTALL fs_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership fs "$pkgdir"/usr/lib/R/library
}


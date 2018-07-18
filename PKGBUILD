# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.23.0
pkgname=r-git2r
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Provides Access to Git Repositories'
arch=('x86_64')
url='https://cran.r-project.org/package=git2r'
license=('GPL2')
depends=('r' )
optdepends=('r-getpass')
source=("https://cran.r-project.org/src/contrib/git2r_"$_cranver".tar.gz")
md5sums=('81d1d98a00d111807471e43513599939')

build(){
    R CMD INSTALL git2r_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership git2r "$pkgdir"/usr/lib/R/library
}


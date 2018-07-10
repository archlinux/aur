# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.22.1
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
md5sums=('42a63a63f2d1edbc89ab57625f6d6218')

build(){
    R CMD INSTALL git2r_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership git2r "$pkgdir"/usr/lib/R/library
}


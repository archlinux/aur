# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.999-3
pkgname=r-expm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Matrix Exponential, Log, etc'
arch=('x86_64')
url='https://cran.r-project.org/package=expm'
license=('GPL')
depends=('r' )
optdepends=('r-rcolorbrewer' 'r-sfsmisc' 'r-rmpfr')
replaces=('r-cran-expm')
source=("https://cran.r-project.org/src/contrib/expm_"$_cranver".tar.gz")
md5sums=('5c0f7500dd129d1a5262eadd92555c7c')

build(){
    R CMD INSTALL expm_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership expm "$pkgdir"/usr/lib/R/library
}


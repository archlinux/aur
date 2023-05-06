# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=0.999-7
pkgname=r-expm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Matrix Exponential, Log, etc'
arch=('x86_64')
url='https://cran.r-project.org/package=expm'
license=('GPL')
depends=('r' )
optdepends=('r-rcolorbrewer' 'r-sfsmisc' 'r-rmpfr')
makedepends=('gcc-fortran')
replaces=('r-cran-expm')
source=("https://cran.r-project.org/src/contrib/expm_"$_cranver".tar.gz")
sha512sums=('0cdc5adc0e2f29c87435f8d9c676341558379a8d5ea49431fc5f8aa60a8b6ddb89b8768938f00f4ebaa2655dfb1bcf2a0baed2f17bdb96090062c8f94f216042')

build(){
    R CMD INSTALL expm_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership expm "$pkgdir"/usr/lib/R/library
}


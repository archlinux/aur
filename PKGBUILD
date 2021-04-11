# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=0.999-6
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
sha512sums=('378b6f7b7319d5521b9b1f4966f2ddcb605b79119446cb4b5faf29bc56ca34e63088b2d59ce1408b3b42b9eae66ec3a6c4c7976452d8ce58a88da47db50b918a')

build(){
    R CMD INSTALL expm_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership expm "$pkgdir"/usr/lib/R/library
}


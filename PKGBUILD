# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=1.2.1
pkgname=r-bsda
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='R Basic Statistics and Data Analysis'
arch=('x86_64')
url='https://cran.r-project.org/web/packages/BSDA/'
license=('GPL')
depends=('r' 'r-e1071')
replaces=('r-cran-bsda')
source=("https://cran.r-project.org/src/contrib/BSDA_"$_cranver".tar.gz")
sha512sums=('f4a6f755b95dd492b124342585ba5960659773e26901f0802e5e92a25a2c01919b86dc79250189b4a30153332c673ed746bad7ea3e983499d62fe63953679a34')

build(){
    R CMD INSTALL BSDA_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership BSDA "$pkgdir"/usr/lib/R/library
}


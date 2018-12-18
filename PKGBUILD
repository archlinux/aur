# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=1.2.0
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
sha512sums=('b169d21dfa74498f6c8244229162d340e7995bf1be4dd7a6149981d3bdba3bdd777b7d91127f93a887b2c5ee645781503fd1b14200ed2e84b4d371cb0a49ea53')

build(){
    R CMD INSTALL BSDA_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership BSDA "$pkgdir"/usr/lib/R/library
}


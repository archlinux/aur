# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=1.7-0
pkgname=r-e1071
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Functions for latent class analysis, short time Fourier transform, fuzzy clustering, support vector machines, shortest path computation, bagged clustering, naive Bayes classifier, ...'
arch=('x86_64')
url='https://cran.r-project.org/web/packages/e1071'
license=('GPL')
depends=('r')
replaces=('r-cran-e1071')
source=("https://cran.r-project.org/src/contrib/e1071_"$_cranver".tar.gz")
sha512sums=('6e0c6308b856c24c80e59716af6e490b72e333f7fc7b2f536864781e18e39c879655feed2c11ade46d46f76b58a22d196cc291d6a1f38c7077a0a2ea3c7f1e15')

build(){
    R CMD INSTALL e1071_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership e1071 "$pkgdir"/usr/lib/R/library
}


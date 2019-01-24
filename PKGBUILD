# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=1.7-0.1
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
sha512sums=('6806ad7a0c34cbcd8e0563b514b901a5bfc5aa9123d43cd0fdeed1325602427e464ecfc663a0450b8ffbd0785391380da416ac8bcfc1e4e5e08a50fc60d3d7ce')

build(){
    R CMD INSTALL e1071_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership e1071 "$pkgdir"/usr/lib/R/library
}


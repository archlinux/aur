# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=1.7-1
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
sha512sums=('df5637ec31adee28466282841aab9fbaaa8c349fc641d17905a16fe8027f16fe6816e2d21aeae50dfb76a1236c6ca1eaf60dd1a15f52ddc9d50a7ab06698e062')

build(){
    R CMD INSTALL e1071_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership e1071 "$pkgdir"/usr/lib/R/library
}


# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

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
sha512sums=('b33fd05a711bca008950381f0a8abade8124112ecc33b62f16e46d416a2d5ca2fefd75a82a8a2cc8eec43864f38a2f7af693ed0ebf213d7f1b8d337ac942135b')

build(){
    R CMD INSTALL expm_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership expm "$pkgdir"/usr/lib/R/library
}


# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranver=0.999-4
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
sha512sums=('a4683feb987e82e7d65ca49c62412320088f69ce4a423e84426a3fd0065b483861ff8b6cbd664c7c689aedff099d792ffe78da8a412289123ee9e319cb4cbd21')

build(){
    R CMD INSTALL expm_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership expm "$pkgdir"/usr/lib/R/library
}


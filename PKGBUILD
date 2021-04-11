# Maintainer: Ward Segers <w@rdsegers.be>

_cranver=0.4-25
pkgname=r-proxy
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='An extensible framework for auto- and cross-proximities'
arch=('x86_64')
url='https://cran.r-project.org/web/packages/proxy'
license=('GPL')
depends=('r')
source=("https://cran.r-project.org/src/contrib/proxy_"$_cranver".tar.gz")
sha512sums=('c9bd65fb0901892b4bf405a301cc5ce9abcee0000afd1fbbb9bf310d3e9f0cc5a5a711b1c430f4c4c34c98e5b08be0405dc4545ec063f1655715eb365d49bce7')

build(){
    R CMD INSTALL proxy_"$_cranver".tar.gz -l "$srcdir"
}

package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership proxy "$pkgdir"/usr/lib/R/library
}



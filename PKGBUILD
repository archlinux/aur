# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.6
pkgname=r-mime
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Map Filenames to MIME Types'
arch=('x86_64')
url='https://cran.r-project.org/package=mime'
license=('GPL')
depends=('r' )
source=("https://cran.r-project.org/src/contrib/mime_"$_cranver".tar.gz")
md5sums=('a033d88ac9bc733868d145fdc44f8c96')

build(){
    R CMD INSTALL mime_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership mime "$pkgdir"/usr/lib/R/library
}


# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranver=2.2.0
pkgname=r-yaml
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Methods to Convert R Data to YAML and Back'
arch=('x86_64')
url='https://cran.r-project.org/package=yaml'
license=('BSD')
depends=('r' )
optdepends=('r-runit')
source=("https://cran.r-project.org/src/contrib/yaml_"$_cranver".tar.gz")
md5sums=('245c28af4248974a445e8a79b7ea2f0f')

build(){
    R CMD INSTALL yaml_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership yaml "$pkgdir"/usr/lib/R/library
}


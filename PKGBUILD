# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=phylonet
_pkgname=PhyloNet
pkgver=3.8.4
pkgrel=3
depends=('java-runtime')
makedepends=('ant' 'java-environment=8')
pkgdesc="suite of software tools for reconstructing/analyzing phylogenetic networks in the presence of reticulate evolutionary events. https://doi.org/10.1093/sysbio/syy015"
arch=('x86_64')
url="https://bioinfocs.rice.edu/PhyloNet"
license=('GPL2')
source=("$pkgname-$pkgver::https://github.com/NakhlehLab/PhyloNet/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08f71a6d9385d2cb4b6125da6138008d413050e2d6f427f9875f1cff79852ab1')
build() {
  cd $_pkgname-$pkgver
  ant jar
}
package() {
  cd $_pkgname-$pkgver
  install -Dm 755 build/jar/$_pkgname.jar ${pkgdir}/usr/share/phylonet/$_pkgname.jar
}


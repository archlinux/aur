# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=ipknot
pkgver=1.0.0
pkgrel=1
pkgdesc="IPknot for predicting RNA pseudoknot structures using integer programming"
arch=('i686' 'x86_64')
url="http://rtips.dna.bio.keio.ac.jp/ipknot/"
license=('GPL')
depends=('glpk>=4.41')
makedepends=(cmake 'viennarna>=2.2.0')
source=("https://github.com/satoken/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b33756e236f7401cff82d3d4516348b9')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}

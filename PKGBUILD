# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=ipknot
pkgver=0.0.5
pkgrel=1
pkgdesc="IPknot for predicting RNA pseudoknot structures using integer programming"
arch=('i686' 'x86_64')
url="http://rtips.dna.bio.keio.ac.jp/ipknot/"
license=('GPL')
depends=('glpk>=4.41')
makedepends=(cmake 'viennarna>=2.2.0')
source=("https://github.com/satoken/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('46f5b30b9454d59c0b99f05d63a50e57')

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

#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=gpuowl
pkgver=7.2
pkgrel=1
pkgdesc="GPU Mersenne primality test"
arch=('x86_64')
url="https://github.com/preda/gpuowl"
license=('GPL3')
depends=('ocl-icd' 'gmp')
source=("https://github.com/preda/gpuowl/archive/v${pkgver}.tar.gz")
sha256sums=('de773b893feb0dd1fd08331a38576d6e885871db9638c9cbf644da47c39c1006')

build() {
cd ${srcdir}/${pkgname}-${pkgver}/
make gpuowl
}

package () {
cd ${srcdir}/${pkgname}-${pkgver}/
install -Dm755 gpuowl ${pkgdir}/usr/bin/gpuowl
}
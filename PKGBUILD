#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=gpuowl
pkgver=7.2.1
pkgrel=1
pkgdesc="GPU Mersenne primality test"
arch=('x86_64')
url="https://github.com/preda/gpuowl"
license=('GPL3')
depends=('ocl-icd' 'gmp')
makedepends=('gcc11')
source=("https://github.com/preda/gpuowl/archive/v${pkgver}.tar.gz"
       'comp.patch')
sha256sums=('e21c6b8fb174e39fe904f9ad57c88d8eb2a33b784d9653791a18d83e58b0932b'
	   'e21d857ecd8536f6a90731bf2783a0d683735f815b62137fa83e9abc830a6654')

#prepare() {
#cd ${srcdir}/${pkgname}-${pkgver}/
#patch --strip=1 < ../comp.patch
#}

build() {
cd ${srcdir}/${pkgname}-${pkgver}/
make
}

package () {
cd ${srcdir}/${pkgname}-${pkgver}/build
install -Dm755 gpuowl ${pkgdir}/usr/bin/gpuowl
}

#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=gpuowl
pkgver=7.5
pkgrel=1
pkgdesc="GPU Mersenne primality test"
arch=('x86_64')
url="https://github.com/preda/gpuowl"
license=('GPL3')
depends=('ocl-icd' 'gmp')
#makedepends=('gcc11')
source=("https://github.com/preda/gpuowl/archive/v${pkgver}.tar.gz")
       #'comp.patch')
sha256sums=('ae45a21e90dfc0a10eab44a8eeb9889d046320b81c88f3c4fb6181b4fee454ef')
	  # 'e21d857ecd8536f6a90731bf2783a0d683735f815b62137fa83e9abc830a6654')

#prepare() {
#cd ${srcdir}/${pkgname}-${pkgver}/
#patch --strip=1 < ../comp.patch
#}

build() {
cd ${srcdir}/${pkgname}-${pkgver}/
make
}

package () {
cd ${srcdir}/${pkgname}-${pkgver}/build-release
install -Dm755 gpuowl ${pkgdir}/usr/bin/gpuowl
}

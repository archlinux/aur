# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2020.02.0
_pkgname=can-utils-${pkgver}
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64' 'armv6h')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
conflicts=("can-utils-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ea0f96a02af37f16713284c7bdccdbae716d9bcb979ccfb51185d696c31f9ecf')

build() {
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

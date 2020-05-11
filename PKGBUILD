# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2020.02.04
_pkgname=can-utils-${pkgver}
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64' 'armv6h')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
conflicts=("can-utils-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a766aad89955b9cfcca27f61ef988fa169565c3657d2789808c0f33a7afa23c8')

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

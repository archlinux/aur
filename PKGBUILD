# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2018.02.0
_pkgname=can-utils-${pkgver}
pkgrel=2
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
conflicts=("can-utils-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('370ad4b19447c29099f7300548f1a3362d6e123c4a6a827dbbd3110bc2c26839')

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

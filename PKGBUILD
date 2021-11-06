# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2021.08.0
_pkgname=can-utils-${pkgver}
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64' 'armv6h')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
conflicts=("can-utils-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c9b8f29515ad34af7f78450ec55c983abc5393e86b1f128a92ac0dfd141baaf7')

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

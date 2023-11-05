# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2023.03
_pkgname=can-utils-${pkgver}
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64' 'armv6h')
url="https://github.com/linux-can/can-utils"
license=('GPL2')
conflicts=("can-utils-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2790dfb57fe3ec22b6fd512838c6480c39f7c9ae193e59f1ae01221216505a7e')

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

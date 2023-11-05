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
source=("git+https://github.com/linux-can/can-utils.git#commit=cfe41963f3425e9adb01a70cfaddedf5e5982720")
sha256sums=('SKIP')

build() {
    cd can-utils
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd can-utils
    make DESTDIR="$pkgdir/" install
}

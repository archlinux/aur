# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2018.02.0
_pkgname=can-utils-${pkgver}
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('any')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
makedepends=("git" "autoconf" "libtool")
provides=("can-utils")
conflicts=("can-utils-git")
source=("https://github.com/linux-can/can-utils/archive/v2018.02.0.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}"
    tar -xzf v2018.02.0.tar.gz
    pwd
    cd "${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install
}

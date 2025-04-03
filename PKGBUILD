# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>

pkgname=can-utils
pkgver=2025.01
_pkgname=can-utils-${pkgver}
pkgrel=2
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/linux-can/can-utils"
license=('GPL-2.0-only')
conflicts=("can-utils-git")
source=("git+https://github.com/linux-can/can-utils.git#commit=01083a64ebf28cc716efe2d2fd51c141042ae34b")
sha256sums=('974ab7b17437d1e9d45b1db4e2ae4142bd3d7c167cdd9deb9efdc59a94173b21')
makedepends=('git' 'cmake' 'ninja')

build() {
    cd can-utils
    cmake -GNinja -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
    ninja
}

package() {
    cd can-utils
    ninja install
}

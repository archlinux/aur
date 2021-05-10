# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-hideaway
pkgver=0.1.0
pkgrel=3
pkgdesc='hideaway: a Interception Tools plugin to hide your mouse pointer'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/hideaway'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/hideaway/-/archive/v${pkgver}/hideaway-v${pkgver}.tar.gz")
sha256sums=('9d5b53e30522e2e046665e5fd9ffd72162d93512932cd2ac7f16d19cd5d46163')

build() {
    cd ${srcdir}/hideaway-v${pkgver}
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/hideaway-v${pkgver}/build

    make DESTDIR="$pkgdir/" install
}

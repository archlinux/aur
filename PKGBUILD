# Maintainer: TheBill2001 <billtran1632001 at gmail dot com>

pkgname=openrgb-idle-notifier
pkgver=1.0.1
pkgrel=1
pkgdesc="Switch OpenRGB profile on idling."
arch=('x86_64')
url="https://gitlab.com/billtran1632001/$pkgname"
license=('GPL3')
depends=('libboost_program_options.so>=1.78' 'libwayland-client.so')
makedepends=('cmake' 'extra-cmake-modules' 'boost' 'wayland')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('83a6ed4646dd76e0cd4a2ec63b19bb667268ba5315dd00339b8c9d0ec33a6a00')
backup=('etc/xdg/openrgb-idle-notifier.conf')

build() {
    cmake \
        -S $pkgname-v${pkgver} \
        -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

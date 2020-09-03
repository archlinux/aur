# Maintainer: ReanGD <reangd at yandex dot ru>
pkgname=rofi-proxy
pkgver=1.0
pkgrel=1
pkgdesc="plugin that allows you to manage rofi state with an external application"
arch=(x86_64)
url="https://github.com/ReanGD/rofi-proxy"
license=('Apache')
depends=(rofi)
optdepends=()
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ReanGD/rofi-proxy/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -Wno-dev
    make -C "${pkgname}-${pkgver}/build" all
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}

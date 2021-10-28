# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=nbt-cpp
pkgver=0.1.1 
pkgrel=1
pkgdesc="NBT C++ Library "
arch=("x86_64")
url="https://github.com/handtruth/nbt-cpp"
license=("MIT")
makedepends=("meson" "cppcheck")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/handtruth/nbt-cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("607990066658a3ea33dd7bcffd81cd240865424649b603e4a0817243dec23659")

build() {
    cd ${pkgname}-${pkgver}
    arch-meson . build
    ninja -C build
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

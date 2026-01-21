# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=json-tui
pkgver=1.4.1
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=(i686 x86_64)
url="https://github.com/ArthurSonzogni/json-tui"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake ninja)
source=("https://codeload.github.com/ArthurSonzogni/json-tui/tar.gz/refs/tags/v${pkgver}")
sha256sums=('54627766339dc22c2c0f5ee5d10297133ea50e92b38ca74f08a6bf2bf2d25d54')

build() {
    cd ${pkgname}-${pkgver}
    cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR=${pkgdir} ninja -C build install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

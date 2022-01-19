# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=json-tui
pkgver=1.3.0
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=(i686 x86_64)
url="https://github.com/ArthurSonzogni/json-tui"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake ninja)
source=("https://codeload.github.com/ArthurSonzogni/json-tui/tar.gz/refs/tags/v${pkgver}")
sha256sums=('8fa62770338d35936c3e31ff4ff7c45c679d1bb432ae897693a9a9dbc0598ff7')

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

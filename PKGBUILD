# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=json-tui
pkgver=1.1.0
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=(i686 x86_64)
url="https://github.com/ArthurSonzogni/json-tui"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake ninja)
source=("https://codeload.github.com/ArthurSonzogni/json-tui/tar.gz/refs/tags/v${pkgver}")
sha256sums=('a23cea38ad70bd1b50c219b482cd23f76b12cf73b9a0d8c1a736fe14787b5152')

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

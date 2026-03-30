# Maintainer: Niladri Adhikary <nil_adhikary at outlook dot com>
pkgname=certamen
pkgver=1.0.2
pkgrel=1
pkgdesc='TUI quiz game engine with SSH multiplayer support written in CPP with FTXUI'
arch=('x86_64')
url='https://github.com/trintlermint/certamen'
license=('MIT')
depends=('yaml-cpp' 'libssh')
makedepends=('cmake' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trintlermint/certamen/archive/v${pkgver}.tar.gz")
sha256sums=('c3e7bd32c5f93f66e32e8d591cb76b803980cf75cdce338820b26c8f1bbb276c')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    install -Dm755 "build/bin/certamen" "${pkgdir}/usr/bin/certamen"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Niladri Adhikary <nil_adhikary at outlook dot com>
pkgname=certamen
pkgver=1.0.3
pkgrel=1
pkgdesc='TUI quiz game engine with SSH multiplayer support written in CPP with FTXUI'
arch=('x86_64')
url='https://github.com/trintlermint/certamen'
license=('MIT')
depends=('yaml-cpp' 'libssh')
makedepends=('cmake' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trintlermint/certamen/archive/v${pkgver}.tar.gz")
sha256sums=('2782c0686abccd3b609d4de50792d1855033875298f3930465b588e677a2fb67')

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

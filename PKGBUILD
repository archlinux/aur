# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr
pkgver=0.1.4
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD'
arch=('any')
url="https://sr.ht/~f9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
source=("https://git.sr.ht/~f9/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('2e5c6a4cb4768ce95c53604b7ff1894ea0f09c395c84bf5d1106476fdda9a2f2')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    strip "target/release/${pkgname}"
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

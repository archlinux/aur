# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

pkgname=gyr
pkgver=0.1.5
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD'
arch=('any')
url="https://sr.ht/~nkeor/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
source=("https://git.sr.ht/~nkeor/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('2df97d64a524af3c6e7cd9b5e6eacc375603ee8329dadb03a071b5fbed2bfbdd')

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

# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr
pkgver=0.1.1
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD'
arch=('any')
url="https://sr.ht/~forkbomb9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
source=("https://git.sr.ht/~forkbomb9/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('d529070ebd673495967a9004b51d1c2c9af48006277a1cf12d035a2b6abd2397')
b2sums=('906ffb16cd8e9e22d8a1d0671310fd284d4699c14e1068700fe35903f45c7d05d566f90c35c4a64a4aeaf5058cb170f0f65296e3bc3a3962ab975e5eaebd07ba')

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

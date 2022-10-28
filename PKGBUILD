# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=rres
pkgver=0.1.3
pkgrel=0
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://sr.ht/~f9/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://git.sr.ht/~f9/rres/archive/v${pkgver}.tar.gz")
sha256sums=('9f4759deedf54ff70674b84c02e494e491ea535e7df377df8bce92f2784e971d')
b2sums=('2076446fe4d15600e09c13227ee95c402bf2db367b8d0e157b01ff65b4369055124c349d83d609e4265ab890bc84964e187486841beb2797160681f142f683a1')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

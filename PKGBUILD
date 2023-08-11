# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=rres
pkgver=0.1.4
pkgrel=0
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://sr.ht/~f9/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://git.sr.ht/~f9/rres/archive/v${pkgver}.tar.gz")
sha256sums=('940ff7a2af884264ebfae4538f8178b7a7a80346063dddc1d515f470974bd34a')
b2sums=('4fa3a5c93fa49ec95a0312da274be021190cd83107115586317ac972ba740b2f00aa27bd8b6f61decf37c3784657ab06ae67d9423448e8f1deeb4af0cd9e7d2b')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

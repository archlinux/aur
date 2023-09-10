# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

pkgname=rres
pkgver=0.1.5
pkgrel=0
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://sr.ht/~nkeor/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://git.sr.ht/~nkeor/rres/archive/v${pkgver}.tar.gz")
sha256sums=('d52d7cf582ebc0827073bdef53937aa3eceea95416019dfa8f076620ae992a61')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

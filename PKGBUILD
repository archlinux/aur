# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=rres
pkgver=0.1.2
pkgrel=2
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://gitlab.com/forkbomb9/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://gitlab.com/forkbomb9/rres/-/archive/v${pkgver}/rres-v${pkgver}.tar.gz")
sha256sums=('3078f9ae166de9d5e2135c9a3f65349735c1a0b7ad007d8ab15102303452af8d')
b3sums=('4b69cacccecc5d0bb55ec3927741f262a93d076102151c8c1f556f449e4e6d40')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

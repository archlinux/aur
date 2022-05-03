# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=rres
pkgver=0.1.2
pkgrel=1
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://gitlab.com/forkbomb9/rres"
license=('GPLv3')
makedepends=('rust')
source=("https://gitlab.com/forkbomb9/rres/-/archive/v${pkgver}/rres-v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}

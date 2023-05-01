# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr
pkgver=0.1.3
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD'
arch=('any')
url="https://sr.ht/~f9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
source=("https://git.sr.ht/~f9/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('74d80bcd7f2ac1e6023b2e72aeded584bac14ee5bda0a642fb55fac4a0e272d5')
b2sums=('d4cf410da2ba91aee054fb1b91b6478966bf716331af07488c856b56282beebb897bba850df115302a48e5b524604ededf28dc0396a952b7f167eab312426d2e')

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

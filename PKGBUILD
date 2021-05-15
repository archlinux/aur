# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.3.0
pkgrel=2
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://sr.ht/~iptq/garbage'
arch=('any')
license=('GPL3')
depends=('rust')
source=("https://git.sr.ht/~iptq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('46736922f3599990b3d5362fc0c48670355db630aff7c4785e94a692ccd4c5b1')

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}

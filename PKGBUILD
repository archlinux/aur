# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.3.0
pkgrel=1
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://sr.ht/~iptq/garbage'
arch=('any')
license=('GPL3')
depends=('rust')
source=("https://git.sr.ht/~iptq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('64135337e599b98a37d3f13ee65387199d9327e68c81e6855d70d9155005778e')

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}

# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.3.3
pkgrel=1
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://sr.ht/~iptq/garbage'
arch=('any')
license=('GPL3')
depends=('cargo')
source=("https://git.sr.ht/~iptq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('98edb72373f7835f07c2026ee76b37f8d2503cc0566c3dfe713c65a3abc0e3d6')

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}

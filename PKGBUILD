# Maintainer: Michael Zhang <mail@mzhang.io>

pkgname=garbage
pkgver=0.3.2
pkgrel=1
pkgdesc='Command-line interface to the FreeDesktop Trash can'
url='https://sr.ht/~iptq/garbage'
arch=('any')
license=('GPL3')
depends=('cargo')
source=("https://git.sr.ht/~iptq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('54ccd01f9692e31295d6e123a0a885182b845d487d95ed69a5a79ff0eb14f39d')

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
}

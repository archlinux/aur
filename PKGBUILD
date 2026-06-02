# Maintainer: George Oastler <goastler4 at gmail dot com>
pkgname=lanscan
pkgver=1.0.5
pkgrel=1
pkgdesc='LAN network scanner — discovers devices via ARP, optionally scans TCP/UDP ports'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/goastler/lan-scan'
license=('AGPL-3.0-only')
makedepends=('rust' 'cargo')
source=("-1.0.5.tar.gz::https://github.com/goastler/lan-scan/archive/refs/tags/v1.0.5.tar.gz")
sha256sums=('cb61b949549f443b66af436af4c663864c990a69b160f28f1c04418b27cf00b6')

build() {
    cd "lan-scan-1.0.5"
    cargo build --release --locked
}

package() {
    cd "lan-scan-1.0.5"
    install -Dm755 target/release/lan "${pkgdir}/usr/bin/lan"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

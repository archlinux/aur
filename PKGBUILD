# Maintainer: SaisakthiM saisakthicloud@gmail.com
pkgname=onebase
pkgver=0.1.0
pkgrel=1
pkgdesc="Single-writer ephemeral data store for tokens, temporary credentials, and one-off logs"
arch=('x86_64')
url="https://github.com/SaisakthiM/onebase"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yourusername/onebase/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256sum after first build

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install binary
    install -Dm755 target/release/onebase "${pkgdir}/usr/bin/onebase"
    
    # Install man page (optional, create man1/onebase.1 if desired)
    # install -Dm644 man/onebase.1 "${pkgdir}/usr/share/man/man1/onebase.1"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

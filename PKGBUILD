# Maintainer: Eran Sandler <eran@sandler.co.il>
pkgname=hyprmon
pkgver=0.0.6
pkgrel=1
pkgdesc="A multi-monitor profile manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/erans/hyprmon"
license=('Apache-2.0') 
depends=('hyprland')
source_x86_64=("${pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64.tar.gz")
sha256sums_x86_64=('e9f2e20159b41d55449628f67302dc578f545786c13a8687f3a787f9ce8e0482')  # Replace with actual checksum
sha256sums_aarch64=('932ede35b03bfda8b9312e3b97f029255c297f617c246fe8259b0dfb86866be2')  # Replace with actual checksum

package() {
    cd "$srcdir"

    # Install the binary (tar.gz should extract just the binary)
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

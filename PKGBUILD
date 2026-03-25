# Maintainer: bostaurus
pkgname=beads-rust-bin
pkgver=0.1.34
pkgrel=1
pkgdesc='Rust port of beads issue tracker — SQLite + JSONL-in-git sync model (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Dicklesworthstone/beads_rust'
license=('LicenseRef-MIT-with-OpenAI-Anthropic-Rider')
depends=('gcc-libs')
provides=('br')
conflicts=('beads-rust')
source=("br-v$pkgver-linux_amd64.tar.gz::https://github.com/Dicklesworthstone/beads_rust/releases/download/v$pkgver/br-v$pkgver-linux_amd64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/Dicklesworthstone/beads_rust/v$pkgver/LICENSE")
sha256sums=('e1e7f5c65e82c8f4d28cf134dbe2790ff0e2a58d2213198634af8e90246d0c6e'
            '32a82e0a5754e72e51fae44b65a936c831c07376f21c90f5fb9e76897fcc3509')

package() {
    install -Dm755 "$srcdir/br" "$pkgdir/usr/bin/br"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

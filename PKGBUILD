# Maintainer: FAHAD ALYAMI <thecord2000@gmail.com>
pkgname=tmuxai-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="AI-Powered, Non-Intrusive Terminal Assistant for tmux (binary release)"
arch=('x86_64')
url="https://github.com/alvinunreal/tmuxai"
license=('Apache-2.0')
depends=('tmux')
provides=('tmuxai')
conflicts=('tmuxai' 'tmuxai-git')
source=("https://github.com/alvinunreal/tmuxai/releases/download/v${pkgver}/tmuxai_Linux_amd64.tar.gz")
sha256sums=('5ad6fde1e292ef123c9225779d9c96925e5fad5fad0fc98ed29b49dac01f91b0')

package() {
    # Install binary
    install -Dm755 tmuxai "$pkgdir/usr/bin/tmuxai"

    # Create documentation directory with basic info
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    echo "TmuxAI - AI-Powered, Non-Intrusive Terminal Assistant" > "$pkgdir/usr/share/doc/$pkgname/README"
    echo "Version: $pkgver" >> "$pkgdir/usr/share/doc/$pkgname/README"
    echo "For configuration examples and documentation, visit: https://github.com/alvinunreal/tmuxai" >> "$pkgdir/usr/share/doc/$pkgname/README"
    echo "Example config can be downloaded from: https://raw.githubusercontent.com/alvinunreal/tmuxai/main/config.example.yaml" >> "$pkgdir/usr/share/doc/$pkgname/README"
}

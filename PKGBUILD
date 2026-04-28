# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=chat-cli-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Configurable LLM chat CLI"
arch=('x86_64')
url="https://github.com/jswysnemc/chat-cli"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ripgrep')
optdepends=(
    'fzf: shell helper integration and quick switching'
    'uv: MCP servers and helper scripts that use Python tooling'
    'wl-clipboard: Wayland clipboard image/text input'
    'xclip: X11 clipboard image/text input'
)
provides=("chat-cli=${pkgver}")
conflicts=('chat-cli' 'chat-cli-git')
source=("chat-cli-bin-0.1.7.tar.gz::${url}/releases/download/v${pkgver}/chat-cli-v0.1.7-linux-x86_64.tar.gz")
sha256sums=('cd7be86b9a47438bceee8fb1b201dfd0e93c1c19f66d31795460c2cfb29e6fae')

package() {
    install -Dm755 chat "${pkgdir}/usr/bin/chat"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_zh.md "${pkgdir}/usr/share/doc/${pkgname}/README_zh.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

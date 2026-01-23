# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=github-mcp-server
pkgver=0.29.0
pkgrel=1
pkgdesc="GitHub's official MCP Server"
arch=(x86_64)
url="https://github.com/github/github-mcp-server/"
license=(MIT)
source=("https://github.com/github/github-mcp-server/releases/download/v${pkgver}/github-mcp-server_Linux_x86_64.tar.gz")
sha256sums=('9baaacbb408feb83961cabd0fb644231713c6e286deda881d121e7804daa6bb4')

package() {
  install -Dm755 github-mcp-server "$pkgdir/usr/bin/github-mcp-server"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Shell completions
install -dm755 "$pkgdir/usr/share/bash-completion/completions"
install -dm755 "$pkgdir/usr/share/zsh/site-functions"
install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

"$srcdir/github-mcp-server" completion bash > "$pkgdir/usr/share/bash-completion/completions/github-mcp-server"
"$srcdir/github-mcp-server" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_github-mcp-server"
"$srcdir/github-mcp-server" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/github-mcp-server.fish"
}


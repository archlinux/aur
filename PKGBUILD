# Maintainer: Svätopluk Hanzel <svatoplukhanzel@pm.me>
pkgname=kraken-cli-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Kraken exchange CLI, interactive shell, and MCP server (upstream binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/krakenfx/kraken-cli'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("kraken-cli=$pkgver")
conflicts=('kraken-cli')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/kraken-cli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a5110521449d74d3d334acb42ffee3b5a7b50112ec845159c1f4a63335148263')
source_aarch64=("$url/releases/download/v$pkgver/kraken-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('6faa83a6f78b096b3a429094fec78d102fcb1dfdd1fc0358755c463a2ec9a215')

package() {
  cd "kraken-cli-$CARCH-unknown-linux-gnu"
  install -Dm755 kraken{,-mcp,-shell} -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CHANGELOG.md DISCLAIMER.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=xgrep-search-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Ultra-fast indexed code search engine with MCP server for AI coding tools"
arch=('x86_64' 'aarch64')
url="https://github.com/momokun7/xgrep"
license=('MIT')
depends=('glibc' 'libgcc')
provides=('xgrep-search')
conflicts=('xgrep-search')
options=('!debug')
source=("LICENSE::https://raw.githubusercontent.com/momokun7/xgrep/v$pkgver/LICENSE")
sha256sums=('afc4a6b887a756554f216a80c628c58c3b891832232cb31e5791997b691d0205')
sha256sums_x86_64=('78fc6cb56cbd1052d2ed4fa8cf9899d240ffed7cbd9cc2879a127d2bbc1c0d6e')
sha256sums_aarch64=('bd806e5242b4c453c32e6ebf9887b44d68ae99ebbc1a50a2a28d2996f8a9021d')

source_x86_64=("xg-$pkgver-x86_64.tar.gz::https://github.com/momokun7/xgrep/releases/download/v$pkgver/xg-x86_64-unknown-linux-gnu.tar.gz")

source_aarch64=("xg-$pkgver-aarch64.tar.gz::https://github.com/momokun7/xgrep/releases/download/v$pkgver/xg-aarch64-unknown-linux-gnu.tar.gz")

package() {
  install -Dm755 xg "$pkgdir/usr/bin/xg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

latestver() {
  curl -fsSLI -o /dev/null -w '%{url_effective}\n' \
    'https://github.com/momokun7/xgrep/releases/latest' |
    sed -nE 's|.*/tag/v([0-9]+(\.[0-9]+)*)$|\1|p'
}

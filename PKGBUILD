# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=hc-tui
pkgname=hc-tui-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="Terminal UI for herdr-core (hc): sidebar with live agent status, tabs, splits, local or over SSH (unofficial)"
arch=('x86_64' 'aarch64')
url="https://github.com/followcat/hc-tui"
license=('Apache-2.0')
depends=()
optdepends=('herdr-core: local herdr-core (hc) backend, auto-started by hc-tui (not needed for --remote SSH mode)')
provides=("hc-tui=$pkgver")
conflicts=('hc-tui')
options=('!debug')
source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/followcat/$_pkgname/v$pkgver/LICENSE"
  "NOTICE-$pkgver::https://raw.githubusercontent.com/followcat/$_pkgname/v$pkgver/NOTICE"
)
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/followcat/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/followcat/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '4badbab5f95176783601d5f44a05b9a2c36e9cefd6d3b252c9591d38b0b230cb')
sha256sums_x86_64=('0ac5e1ceed7b666ee8d18dd31d7c413aed8f21341490faebae080461c1a9dd0c')
sha256sums_aarch64=('f8e5c4d057f66d1aaa4ea25b3a4a1df7e9bbfabdabc352110517dda33046f5c6')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=hc-tui
pkgname=hc-tui-bin
pkgver=0.1.12
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
sha256sums_x86_64=('d1907a3be0d2ef0f39361f6ca70b21a7549bd0490d9593da021ad9be6b7d301a')
sha256sums_aarch64=('e85bf70e18626457dc5e6e1d20d60a10c4801c0b6a5e777940027d17f7be3c5c')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

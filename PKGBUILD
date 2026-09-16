# Maintainer: objz <me@objz.dev>
pkgname=rmcl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/rmcl"
license=('GPL-3.0-only')
depends=()
provides=('rmcl')
conflicts=('rmcl' 'rmcl-git' 'mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
replaces=('mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE" "README-${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("rmcl-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/rmcl-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("rmcl-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/rmcl-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b2ae38e671542141fc5d65b7b1a0dd8928fca3c1ae3235709d348ab8659e110c')
sha256sums_x86_64=('796f9a36eeb1e81b3f094a31ea8cbc09b1af2d9774659dc302ed96b9c6d84243')
sha256sums_aarch64=('a39479809fe7fc6e7b6852664db87d3799774cce1545ca7780e4648f0a1b0dca')

package() {
  local _dir="rmcl-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: objz <me@objz.dev>
pkgname=rmcl-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/rmcl"
license=('GPL-3.0-only')
depends=('libxcb')
provides=('rmcl')
conflicts=('rmcl' 'rmcl-git' 'mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
replaces=('mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE" "README-${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("rmcl-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/rmcl-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("rmcl-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/rmcl-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '920d1d53e7897f7d75acb531a10d892522f58866102c6e34d1cfc57f866bd8a4')
sha256sums_x86_64=('95cdafc71dc482c22befe800af6f1b61ecc3f5426ec7a5b32a500df874e154f6')
sha256sums_aarch64=('a79c7a04ce019c5f722e3ad1ef5d9d9fa1720743998f063cf30942c22765e478')

package() {
  local _dir="rmcl-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

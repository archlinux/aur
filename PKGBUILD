# Maintainer: objz <me@objz.dev>
pkgname=rmcl-bin
pkgver=0.6.1
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
            '7455a77e9de1dce7065b1e5e99bf40eca58d623aa6df76a3a43038033f8e939d')
sha256sums_x86_64=('f33d4739d16e556c12b8dec96ec091d36139123a7d53b01db09b95be12793cc6')
sha256sums_aarch64=('9ef9357f7e1ff8fd75a1750950952c2c526a3256f724d4885ef9538d6e7bb814')

package() {
  local _dir="rmcl-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

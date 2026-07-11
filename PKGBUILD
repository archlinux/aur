# Maintainer: objz <me@objz.dev>
pkgname=rmcl-bin
pkgver=0.3.3
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
            '716a48f818f0f7a67703172cee46661948eec88063c6ac5bbdae6ce2cdafb577')
sha256sums_x86_64=('b399c48564e1e40788a07e8feb5d0c8c906eb80e3a90e0aa8b7d50b8b2fa3d07')
sha256sums_aarch64=('c40e54beb9d1d0622c0fb332f1f9d110334246e200d86a9b2df6e3d1f363b849')

package() {
  local _dir="rmcl-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/mcl"
license=('GPL-3.0-only')
depends=()
provides=('mcl-launcher')
conflicts=('mcl-launcher' 'mcl-launcher-git')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE" "README-${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/mcl-launcher-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/mcl-launcher-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '85e85c7faa5baa2af294e66a1505e013c2fe860737484d18efb0341e6c24bc80')
sha256sums_x86_64=('62a13776d4393e3ba3595b2e0ac5e39a348ad416f5bfdf8b3dc691257652a085')
sha256sums_aarch64=('58f54a20edf6a8cbdb5dc4cb97a06135c036a93a047f6f8a7d8a665ece9f1454')

package() {
  local _dir="mcl-launcher-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/mcl" "$pkgdir/usr/bin/mcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

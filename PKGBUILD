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
source_x86_64=("mcl-launcher-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/mcl-launcher-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("mcl-launcher-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/mcl-launcher-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '85e85c7faa5baa2af294e66a1505e013c2fe860737484d18efb0341e6c24bc80')
sha256sums_x86_64=('c582f6f794583cd6e5eae96aa9f59d354ec88fdf97b5143e1c967aa47695bb0b')
sha256sums_aarch64=('60bcb610aecc3ca529fe2fd836998ece6fb716be61d699052b1287fb87ca5fc1')

package() {
  local _dir="mcl-launcher-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/mcl" "$pkgdir/usr/bin/mcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

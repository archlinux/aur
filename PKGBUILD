# Maintainer: objz <me@objz.dev>
pkgname=rmcl-bin
pkgver=0.6.3
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
            'c7a9d8f60819ee63b951131c0aa1fd9f37c93b2e3a922bf9843b4afacbcd1e79')
sha256sums_x86_64=('73a4f657afb6f375ecb005b55b42ad6246f3a1c503fadc652d324b310cd27ce5')
sha256sums_aarch64=('b3283e25f75f85b123a646d180c59574652ea87157290f1fcf4e2c39ce942366')

package() {
  local _dir="rmcl-${CARCH}-unknown-linux-gnu"
  install -Dm755 "$_dir/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

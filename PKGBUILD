# Maintainer: SignalRidge <support@signalridge.com>
pkgname=mare-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Hyperextensible AI coding agent harness (Rust core, Lua 5.5 plugins)"
arch=('x86_64' 'aarch64')
url="https://github.com/signalridge/mare"
license=('Apache-2.0')
depends=('gcc-libs')
optdepends=('bubblewrap: Linux sandbox isolation')
provides=('mare')
conflicts=('mare')
source_x86_64=("mare-1.0.0-x86_64.tar.gz::https://github.com/signalridge/mare/releases/download/v1.0.0/mare-v1.0.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("mare-1.0.0-aarch64.tar.gz::https://github.com/signalridge/mare/releases/download/v1.0.0/mare-v1.0.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('94ef6a1fb3319ad435262c01002e0e14483f24181b014c6e2729e2580f2bfe9a')
sha256sums_aarch64=('3f046f68f3ea0c03cca7c4f45948b272e63785d9e37881abb6f2ca22fdf45443')

package() {
  local target_arch="$CARCH"
  local dir="$srcdir/mare-v1.0.0-$target_arch-unknown-linux-gnu"
  install -Dm755 "$dir/mare" "$pkgdir/usr/bin/mare"
  install -Dm644 "$dir/LICENSE" "$pkgdir/usr/share/licenses/mare-bin/LICENSE"
  install -Dm644 "$dir/THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/mare-bin/THIRD_PARTY_NOTICES.md"
  install -Dm644 "$dir/licenses/cordis-LICENSE" "$pkgdir/usr/share/licenses/mare-bin/cordis-LICENSE"
  install -Dm644 "$dir/licenses/RUST-THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/mare-bin/RUST-THIRD-PARTY-NOTICES.txt"
  install -Dm644 "$dir/README.md" "$pkgdir/usr/share/doc/mare-bin/README.md"
}

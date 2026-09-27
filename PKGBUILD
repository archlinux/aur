# Generated from verified aros-tools release manifests.
# Source commit: b5a2e9ea54bdaf50712b16f5c64dc89fd8c87e62
pkgname=aros-tools-bin
pkgver=0.3.13
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.13/aros-tools-v0.3.13-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('1b8ca19436b467d15c9ba4a9595262d748e8739e93f5f1e403ed3471a620c437')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.13/aros-tools-v0.3.13-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('8725d3edcd578b069a510784701e916050f5275fab74987b60822ee786809ecb')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.13-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

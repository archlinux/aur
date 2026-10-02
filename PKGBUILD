# Generated from verified aros-tools release manifests.
# Source commit: 74e6958b9bee8805a077bac1f5b6febe758aa690
pkgname=aros-tools-bin
pkgver=0.3.17
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.17/aros-tools-v0.3.17-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('b949cbd3bb00104958f012f89a383145d4d8dd2f7e4e947694c00c2ce2473cf6')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.17/aros-tools-v0.3.17-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('c532a1fe09bb4448032ac8fae8b636f949611b4b35fbca4462fd4a3b2807b702')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.17-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

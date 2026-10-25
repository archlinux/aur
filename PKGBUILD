# Generated from verified aros-tools release manifests.
# Source commit: c8e624595e43014a4ba29dfae02d53850d4a3c9d
pkgname=aros-tools-bin
pkgver=0.6.4
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.4/aros-tools-v0.6.4-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('9a2dd71077a70bfbda50b285bd4afa7bdae5636ff5a9c0590c3e5ae25911abde')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.4/aros-tools-v0.6.4-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('cf203df04f80c1b19442fd65ff367361f4fb81c31fdb125d079f5971584ebf1b')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.4-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

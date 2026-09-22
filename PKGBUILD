# Generated from verified aros-tools release manifests.
# Source commit: a940dc435cc9d3710764263905651bd88dfa6449
pkgname=aros-tools-bin
pkgver=0.3.9
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.9/aros-tools-v0.3.9-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('eb700e423db98bbe762383fc7eaf5604c04657e0f14c25220f1943a4cbf406a8')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.9/aros-tools-v0.3.9-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('d3e1e7ed73febd5f88d7cd9bc3e19c0b18cf871a2c255dfb8a051a98363ee001')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.9-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

# Generated from verified aros-tools release manifests.
# Source commit: a5bffa8d38db7c9bb2759dd79ec770ec375565f0
pkgname=aros-tools-bin
pkgver=0.6.11
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.11/aros-tools-v0.6.11-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('c22084c89a2df1abe15ffa524990c2a767e574b54b84688945bd3ade1c7534de')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.11/aros-tools-v0.6.11-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('eb6e3c190a23bbf319951a7f2d41f49713aaa3890c70c31c80aba4c616229ffa')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.11-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

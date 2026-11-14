# Generated from verified aros-tools release manifests.
# Source commit: b60651883de68f3f234769c51878d140febf660c
pkgname=aros-tools-bin
pkgver=0.6.16
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.16/aros-tools-v0.6.16-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('a72f7040226f43defe3e36aabc5d8174f8579ef895ac59bf21f134f01d9abbdb')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.16/aros-tools-v0.6.16-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('9402ce24338d3f6026830fde70660b2be2f044a7b80b6de31f9ba5870503075f')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.16-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

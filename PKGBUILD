# Generated from verified aros-tools release manifests.
# Source commit: 040290f7158f77c311b76b194a30a034c74c03d7
pkgname=aros-tools-bin
pkgver=0.3.16
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.16/aros-tools-v0.3.16-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('29dcb55fe0136a6853e3c6c6f7cd16e09609bba7c4a08da2b297ec3f4a7f7682')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.16/aros-tools-v0.3.16-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('bf9dcf3aaefe2eb01ca06fc94100137064ead4b9eeb54e2efe90ebe96f7db3ce')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.16-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

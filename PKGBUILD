# Generated from verified aros-tools release manifests.
# Source commit: 76740de8f0478ce36acbf98dce2eb7687d8860c8
pkgname=aros-tools-bin
pkgver=0.6.17
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.17/aros-tools-v0.6.17-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('edc2709c81c8e7e5027edd49de26449a84bd37be078eab32bc9172666bf84086')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.17/aros-tools-v0.6.17-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('b8168c3e07e6d14a1d54c46db948f0b2ca6890c58882514c03c74f0f1f717838')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.17-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

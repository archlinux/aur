# Generated from verified aros-tools release manifests.
# Source commit: ee87321fa16ac04b6fa59b6d547dc5a6fb204f80
pkgname=aros-tools-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.0/aros-tools-v0.6.0-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('19b28af05609eb2d633270c8a96de9cb9cdd862955216d20ecef13d2810b27a2')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.0/aros-tools-v0.6.0-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('f109c07311530e253c33b9e7accbb2fee2d85d4740d644eea2954ea4ec4fb07b')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.0-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

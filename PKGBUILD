# Generated from verified aros-tools release manifests.
# Source commit: b399c714560e6629b4084290ce5575513521c8e3
pkgname=aros-tools-bin
pkgver=0.3.19
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.19/aros-tools-v0.3.19-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('96b0219d6cf29460fee07fd415978f52bc91d2d8ac3f484195cb63f7e11d984a')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.19/aros-tools-v0.3.19-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('d3cdfb860c4bb381a2bb1540959f9d895ab2101cdda64dd21450c8878c72bef3')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.19-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

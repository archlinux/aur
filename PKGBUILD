# Generated from verified aros-tools release manifests.
# Source commit: 55d33f4072a33d578079faf2b5a37609a2b835cb
pkgname=aros-tools-bin
pkgver=0.6.8
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.8/aros-tools-v0.6.8-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('8d9ca9327e105933de7749cccd7bbeadb648670558b84c842c4289a05256772e')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.8/aros-tools-v0.6.8-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('bcea3a5151fa026a13d7d2feff9f763f80a9756efa8bcd505c358728336cb61e')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.8-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

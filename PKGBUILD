# Generated from verified aros-tools release manifests.
# Source commit: c34994e08504226cf94434ab8dd95c73c42709f1
pkgname=aros-tools-bin
pkgver=0.6.12
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.12/aros-tools-v0.6.12-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('fe401f034d866db62128c6da871569971890d32ffe724244dfae3f0a530468c7')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.12/aros-tools-v0.6.12-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('68a9479856e09bc37e3b9782e66abd7200ffbf0d3d314075cf405bf8a4b13c67')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.12-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

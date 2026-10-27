# Generated from verified aros-tools release manifests.
# Source commit: ca26c8e201cf4dbfdcc71ee50d66c896696a7382
pkgname=aros-tools-bin
pkgver=0.6.7
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.7/aros-tools-v0.6.7-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('80fd10728a942bf81a733758b318876aa3c8e842e0fd84ed9371d061df11478a')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.7/aros-tools-v0.6.7-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('f790db781a71cbeb121705fafa33cbc884a5d453be19aec975bf70942585b93c')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.7-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

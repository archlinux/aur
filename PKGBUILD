# Generated from verified aros-tools release manifests.
# Source commit: 3dec1130acf774ea457f8761780fb27617a73897
pkgname=aros-tools-bin
pkgver=0.6.5
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.5/aros-tools-v0.6.5-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('c8ea4ec4afdbf98997423884e981988411eeb6eea733e45191f1fda5e87bbc21')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.5/aros-tools-v0.6.5-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('49ea67b6c6cf3516270d56625a6023ed1a4addd896d6a57f6eefe5918c1a8ba7')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.5-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

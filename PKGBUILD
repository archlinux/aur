# Generated from verified aros-tools release manifests.
# Source commit: 873654f7d171a81847dfbd51c86ff2ea977a25b6
pkgname=aros-tools-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.2/aros-tools-v0.6.2-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('92c5a69fd30ad0dadf73e709141ea29061b6c693860872c7282854f6686d9745')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.2/aros-tools-v0.6.2-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('207183927dc54dc15f596b02f19b59521f7cd355f2e396025eb41e192b7ba284')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.2-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

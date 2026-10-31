# Generated from verified aros-tools release manifests.
# Source commit: 23a5640c052c27aca07b747ddae7055748d67150
pkgname=aros-tools-bin
pkgver=0.6.10
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.10/aros-tools-v0.6.10-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('dcb1ebc46e61c6f2c98fb4cf3c9732ed6bdd0fa16182ecd60d48b96712404346')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.10/aros-tools-v0.6.10-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('8f73ff7dff4c76e05bb3aad7f8c135fe9855a1524f3ca66c19cf2228ef2ad6f4')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.10-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

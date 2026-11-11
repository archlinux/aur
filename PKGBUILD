# Generated from verified aros-tools release manifests.
# Source commit: b664cbab32cac7433c7e6c8047658cc14112cb21
pkgname=aros-tools-bin
pkgver=0.6.15
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.15/aros-tools-v0.6.15-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('361a9115d24681c7352a78df08be20318edd48a85ff75f337210d5e26e5555e6')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.15/aros-tools-v0.6.15-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('017e9a247f28e785fcc5044c5f6971038ecf2d6ff4a1a55ae3d9207115046eb8')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.15-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

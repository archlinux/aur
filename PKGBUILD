# Generated from verified aros-tools release manifests.
# Source commit: b24fa9faab9070fd9dd37d60e3c37d07e3f7287e
pkgname=aros-tools-bin
pkgver=0.6.9
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.9/aros-tools-v0.6.9-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('a2339ce4ba14938c7537a53e9f6efbf21282d51464de96d76202d026f5cb8dfd')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.9/aros-tools-v0.6.9-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('c414f99dcbf5d07af4d8f222b9c50c0598c988a68ecc610281c7a7009345b349')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.9-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

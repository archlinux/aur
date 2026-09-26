# Generated from verified aros-tools release manifests.
# Source commit: ff08ff9df3556113a1eafc9733c3eb0f9445007c
pkgname=aros-tools-bin
pkgver=0.3.12
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.12/aros-tools-v0.3.12-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('a05696e42e1fc3d6639c0399f058ecff78276a03c13126aa62e69a7d3d53f4c6')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.12/aros-tools-v0.3.12-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('703f0d2f68e3b9b71592b807701ef3d744467bf999a022e6419560cb8097ae7e')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.12-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

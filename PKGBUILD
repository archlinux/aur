# Generated from verified aros-tools release manifests.
# Source commit: 08f0b3c6ef41abfcb8e10bf3075586f9c7c3c1ce
pkgname=aros-tools-bin
pkgver=0.6.13
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.13/aros-tools-v0.6.13-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('39a1e6d8639e7c158872084d5d6d9c52a50cbbd294ade1c1d6f5a47fb8bd589f')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.13/aros-tools-v0.6.13-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('8eda004ff230b6b3e04e0d0a50a821d452d48bf90ae142993ba0589d76347a53')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.13-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

# Generated from verified aros-tools release manifests.
# Source commit: 281d4fc83314555e761d814d259e7647a14aa82e
pkgname=aros-tools-bin
pkgver=0.3.18
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.18/aros-tools-v0.3.18-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('45988f08f4e0a446500aee316954522ab1886ce61a13d0a0c9b69bc6a9f84119')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.3.18/aros-tools-v0.3.18-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('bd5e1cf3a7659c839dbb455b7af4b91e6cb856ddf745837d14a906cb347799dc')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.3.18-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

# Generated from verified aros-tools release manifests.
# Source commit: ad960083efd8107ed34acaf91376da9ae80ad1c3
pkgname=aros-tools-bin
pkgver=0.6.14
pkgrel=1
pkgdesc='Reproducible host-side build and development tools for AROS'
arch=('x86_64' 'aarch64')
url='https://github.com/metaneutrons/aros-tools'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ca-certificates' 'cmake' 'curl' 'git' 'ninja' 'patch' 'python')
provides=('aros-tools')
conflicts=('aros-tools')
options=('!strip')
source_x86_64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.14/aros-tools-v0.6.14-x86_64-unknown-linux-gnu.tar.gz')
sha256sums_x86_64=('6e59302af34c97ea2aba84deef33c54cca49dbfe5e42fee4152cf6740eed22fc')
source_aarch64=('https://github.com/metaneutrons/aros-tools/releases/download/v0.6.14/aros-tools-v0.6.14-aarch64-unknown-linux-gnu.tar.gz')
sha256sums_aarch64=('109b0e9367f79c7ea9f9b465fd1f22b520979b122ef9529c5f8b5feb8459dcf8')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) return 1 ;;
  esac
  local root="$srcdir/aros-tools-v0.6.14-$target"
  install -Dm755 "$root"/bin/* -t "$pkgdir/usr/bin"
  install -Dm644 "$root/README.md" -t "$pkgdir/usr/share/doc/aros-tools"
  install -Dm644 "$root/LICENSE" -t "$pkgdir/usr/share/licenses/aros-tools"
}

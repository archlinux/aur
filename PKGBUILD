# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

pkgname=hakoniwa-bin
pkgver=1.8.1
pkgrel=3
pkgdesc="Process isolation for Linux using namespaces, resource limits, cgroups, landlock and seccomp."
arch=("x86_64")
url="https://github.com/souk4711/hakoniwa"
license=("GPL-3.0-only")
depends=("libseccomp" "passt" "shadow")
provides=("hakoniwa")
conflicts=("hakoniwa")
source=("https://github.com/souk4711/hakoniwa/releases/download/v$pkgver/hakoniwa-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('61a568c8ccaeb88ce20ee2d3d87cbfe5a546bc1e345db6d4c3ebdd3814229086')

package() {
  cd "$srcdir/"
  install -Dm0755 "hakoniwa" "$pkgdir/usr/bin/hakoniwa"
  install -Dm644 "etc/bash/completions/hakoniwa" "$pkgdir/usr/share/bash-completion/completions/hakoniwa"
  install -Dm644 "etc/fish/vendor_completions.d/hakoniwa.fish" "$pkgdir/usr/share/fish/vendor_completions.d/hakoniwa.fish"
  install -Dm644 "etc/zsh/site-functions/_hakoniwa" "$pkgdir/usr/share/zsh/site-functions/_hakoniwa"
}

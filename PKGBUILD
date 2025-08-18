# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Juan Tascon <juantascon@horlux.org>
# Contributor: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=4.4.0
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=('x86_64')
license=('MIT')
depends=('bash')
makedepends=('git')
source=("${pkgname}::git+https://github.com/kerl/kerl.git#tag=${pkgver}")
sha256sums=('c41ee5140304ad1f69ffa8263c8ee1c2a611fb519fbfbaa022eb5cc7301b72cb')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
  install -Dm644 bash_completion/kerl "$pkgdir/usr/share/bash-completion/completions/kerl"
  install -Dm644 zsh_completion/_kerl "$pkgdir/usr/share/zsh/site-functions/_kerl"
  install -Dm644 fish_completion/kerl.fish "$pkgdir/usr/share/fish/vendor_completions.d/kerl.fish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/kerl/LICENSE.md" 
}

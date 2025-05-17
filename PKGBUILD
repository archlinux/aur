# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Juan Tascon <juantascon@horlux.org>
# Contributor: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=4.3.1
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=('x86_64')
license=('MIT')
depends=('bash')
makedepends=('git')
source=("${pkgname}::git+https://github.com/kerl/kerl.git#tag=${pkgver}")
sha256sums=('cf6939383f0a9bc0cb3a701616cc9f7bf5141a2c3048cef5e8b3772ed49af33a')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
  install -Dm644 bash_completion/kerl "$pkgdir/usr/share/bash-completion/completions/kerl"
  install -Dm644 zsh_completion/_kerl "$pkgdir/usr/share/zsh/site-functions/_kerl"
  install -Dm644 fish_completion/kerl.fish "$pkgdir/usr/share/fish/vendor_completions.d/kerl.fish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/kerl/LICENSE.md" 
}

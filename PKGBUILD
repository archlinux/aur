# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Juan Tascon <juantascon@horlux.org>
# Contributor: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=4.3.0
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=('x86_64')
license=('MIT')
depends=('bash')
source=("kerl-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('623025404407cf04a9a9c10c3d944769cb7c442dcf737105574b1ad9e47121ef1ed07adbe4cbec69822cd59f5ca283532c1c309d2c60210dd9f68c2e9119e06f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
  install -Dm644 bash_completion/kerl "$pkgdir/usr/share/bash-completion/completions/kerl"
  install -Dm644 zsh_completion/_kerl "$pkgdir/usr/share/zsh/site-functions/_kerl"
  install -Dm644 fish_completion/kerl.fish "$pkgdir/usr/share/fish/vendor_completions.d/kerl.fish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/kerl/LICENSE.md" 
}

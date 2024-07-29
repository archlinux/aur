# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Juan Tascon <juantascon@horlux.org>
# Contributor: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=4.2.0
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=('x86_64')
license=('custom')
depends=('bash')
source=("kerl-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('803ee12cf0cb78ad421e48b75d4e37d1182f36dbfed6b688ad15d425792e93ed0cebce3f4af7ed8e69297d1d54273f42b1b0fb2b508d2d691b388934c3497798')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
  install -Dm644 bash_completion/kerl "$pkgdir/usr/share/bash-completion/completions/kerl"
  install -Dm644 zsh_completion/_kerl "$pkgdir/usr/share/zsh/site-functions/_kerl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/kerl/LICENSE.md" 
}

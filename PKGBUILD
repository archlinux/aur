# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=agdsn-zsh-config
pkgver=0.6.0
pkgrel=1
pkgdesc="AG DSN Zsh Config"
arch=('any')
url='https://github.com/agdsn/agdsn-zsh-config'
license=('GPL2')
depends=('zsh' 'coreutils' 'grep' 'sed' 'procps')
makedepends=('git')
conflicts=('grml-zsh-config')
provides=('grml-zsh-config' 'grmlzshrc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agdsn/agdsn-zsh-config/archive/v${pkgver}.tar.gz")
sha256sums=('017d5f2959d1e628ebcfe0c0401c5416271210de6009acf561b0ffd3ed18a08c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 zshrc-home.zsh "$pkgdir/etc/skel/.zshrc"
  install -Dm644 zshrc-base-hw.zsh "$pkgdir/etc/zsh/zshrc"
  install -Dm644 profile-d-agdsn-zsh-config.sh "$pkgdir/etc/profile.d/agdsn-zsh-config.sh"
}

# vim:set ts=2 sw=2 et:

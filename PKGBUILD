# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=agdsn-zsh-config
pkgver=0.8.0
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
sha256sums=('82396d4aade6c459427f138f3c87914dd2b576a039b1a96a199c88236826c080')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 zshrc-home.zsh "$pkgdir/etc/skel/.zshrc"
  install -Dm644 zshrc-base-hw.zsh "$pkgdir/etc/zsh/zshrc"
  install -Dm644 profile-d-agdsn-zsh-config.sh "$pkgdir/etc/profile.d/agdsn-zsh-config.sh"
}

# vim:set ts=2 sw=2 et:

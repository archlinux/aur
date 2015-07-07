# Maintainer: fsckd <fsckdaemon at gmail dot com>
# Contributor: veox <veox at wre dot ath dot cx>

pkgname=zsh-history-substring-search-git
pkgver=74.3bd84be
pkgrel=1
epoch=1
pkgdesc="A ZSH plugin to search history, a clean-room implementation of the Fish shell feature"
arch=('any')
url="https://github.com/zsh-users/zsh-history-substring-search"
license=('BSD')
depends=('zsh')
makedepends=('git')
provides=('zsh-history-substring-search')
conflicts=('zsh-history-substring-search')
install=zsh-history-substring-search-git.install
source=('git://github.com/zsh-users/zsh-history-substring-search')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  local name="${pkgname%-git}"
  cd "$srcdir/$name"
  install -d -m755 "$pkgdir/usr/share/zsh/plugins/$name"
  install -m644 README.md "$name".{zsh,plugin.zsh} "$pkgdir/usr/share/zsh/plugins/$name"
}

# vim:set ts=2 sw=2 et:

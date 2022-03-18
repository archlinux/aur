# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: fsckd <fsckdaemon at gmail dot com>
# Contributor: veox <veox at wre dot ath dot cx>

pkgname=zsh-history-substring-search-git
pkgver=1.0.2.r8.g4abed97
pkgrel=1
epoch=2
pkgdesc="A ZSH plugin to search history, a clean-room implementation of the Fish shell feature"
arch=('any')
url="https://github.com/zsh-users/zsh-history-substring-search"
license=('BSD')
depends=('zsh')
makedepends=('git')
provides=('zsh-history-substring-search')
conflicts=('zsh-history-substring-search')
install=zsh-history-substring-search-git.install
source=('git+https://github.com/zsh-users/zsh-history-substring-search')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local name="${pkgname%-git}"
  cd "$srcdir/$name"
  install -vDm 644 "${name}.zsh" \
    -t "${pkgdir}/usr/share/zsh/plugins/${name}/"
  # docs
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:

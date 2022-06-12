# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=zsh-fzy
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="Use the fzy fuzzy-finder in ZSH"
arch=('any')
url="https://github.com/aperezdc/zsh-fzy"
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("git+https://github.com/aperezdc/zsh-fzy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 zsh-fzy.plugin.zsh "$pkgdir/usr/share/zsh/plugins/zsh-fzy/zsh-fzy.zsh"
  ln -s zsh-fzy.zsh "$pkgdir/usr/share/zsh/plugins/zsh-fzy/zsh-fzy.plugin.zsh"
  install -Dm755 fzy-tmux "$pkgdir/usr/share/zsh/plugins/zsh-fzy/fzy-tmux"
}

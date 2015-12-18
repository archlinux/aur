# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=zsh-autopair-git
_gitname=zsh-autopair
pkgver=r32.86b6d0e
pkgrel=1
pkgdesc="Auto-close and delete matching delimiters in Zsh"
arch=(any)
url=https://github.com/hlissner/zsh-autopair
license=(custom:MIT)
depends=(zsh)
makedepends=(git)
provides=(zsh-autopair)
conflicts=(zsh-autopair)
source=git+https://github.com/hlissner/zsh-autopair
install=zsh-autopair-git.install
sha256sums=SKIP


pkgver() {
    cd "$_gitname"
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

package() {
  cd "$_gitname"

  install -Dm644 autopair.zsh "$pkgdir"/usr/share/zsh/plugins/"$_gitname"/autopair.zsh
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$_gitname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

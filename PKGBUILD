# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.2.0
pkgrel=1
pkgdesc="Extra keybindings for fzf"
arch=('any')
depends=('bash' 'fzf' 'tmux')
optdepends=('ctags: select tags'
            'fasd: fuzzy find frecency files, directories'
            'git: git checkout fuzzy commits, branches'
            'mlocate: locate files'
            'xdg-utils: open files'
            'zsh: zsh keybindings')
url="https://github.com/atweiden/fzf-extras"
license=('MIT')
source=(https://github.com/atweiden/fzf-extras/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c7aa6af98303c7190625099179a6b5503be19d6f52189821f0e471e8fc1e7f51')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/fzf-extras"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh -t "$pkgdir/etc/profile.d"
}

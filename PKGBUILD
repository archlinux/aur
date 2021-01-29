# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.3.1
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
sha512sums=('337e6ba657bb04b3973a2b223ef80d193ef3c67a68d4ca136e7e1a3a03fa359ffb4fdbe3875de112448f236222fbdada5d987c34b31efd7255cd61adb83354b0')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/fzf-extras/README.md"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/usr/share/fzf/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh "$pkgdir/usr/share/fzf/fzf-extras.zsh"
}

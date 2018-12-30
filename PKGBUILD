# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.2.0
pkgrel=2
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
sha512sums=('f95203648ea238b94d4b170913afb8eb608b53e2e6d96730c5423b6e621190efb4c7f22837bd00357be40075bee3e9a62320c70b9b3e6aa13e94a98271d32a06')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/fzf-extras/README.md"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/usr/share/fzf/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh "$pkgdir/usr/share/fzf/fzf-extras.zsh"
}

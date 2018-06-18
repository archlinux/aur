# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.0.22
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
sha256sums=('d9c21f6b0beca7d77539db6eb043bcbe16210e0ae3d34aa8dd26e988caea066e')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/fzf-extras"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh -t "$pkgdir/etc/profile.d"
}

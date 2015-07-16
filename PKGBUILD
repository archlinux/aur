# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.0.7
pkgrel=1
pkgdesc="Extra keybindings for fzf"
arch=('any')
depends=('fzf')
optdepends=('ctags: select tags'
            'git: git checkout fuzzy commits, branches'
            'mlocate: locate files'
            'vim-fzf: fzf.vim'
            'xdg-utils: open files'
            'zsh: zsh keybindings')
url="https://github.com/atweiden/fzf-extras"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('1c09c73aefc1c6026e15003b9efd65593c1857fb1ad4a21abc7c57f53b95090d')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/fzf-extras/README.md"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh "$pkgdir/etc/profile.d/fzf-extras.zsh"
}

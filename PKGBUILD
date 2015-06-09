# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.0.5
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
sha256sums=('ab46f8cd298460d85fa9402f64d4d62563d98be0bc241fa8bc61632ccb824cd9')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/fzf-extras/README.md"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh "$pkgdir/etc/profile.d/fzf-extras.zsh"
}

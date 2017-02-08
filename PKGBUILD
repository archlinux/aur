# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=fzf-extras
pkgver=0.0.20
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
sha256sums=('6fd174f7e14e308116558a50cc31ebefd65fcf547e0db8e59f494880abc9403e')
install=fzf-extras.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/fzf-extras"

  msg2 'Installing...'
  install -Dm 755 fzf-extras.sh "$pkgdir/etc/profile.d/fzf-extras.bash"
  install -Dm 755 fzf-extras.zsh -t "$pkgdir/etc/profile.d"
}

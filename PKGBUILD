# Maintainer: John Jenkins twodopeshaggy@gmail.com
_pkgname=tmuxline.vim
pkgname=vim-tmuxline-git
pkgver=1415220048
pkgrel=1
pkgdesc="Simple tmux statusline generator with support for powerline symbols and airline integration"
arch=('any')
url='https://github.com/edkolev/tmuxline.vim'
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-tmuxline')
conflicts=('vim-tmuxline')

source=('git://github.com/edkolev/tmuxline.vim.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}


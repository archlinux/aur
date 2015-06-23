# Maintainer: John Jenkins twodopeshaggy@gmail.com
_pkgname=promptline.vim
pkgname=vim-promptline-git
pkgver=1416082879
pkgrel=1
pkgdesc="Generate a fast shell prompt with powerline symbols and airline colors"
arch=('any')
url='https://github.com/edkolev/promptline.vim'
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-promptline')
conflicts=('vim-promptline')

source=('git://github.com/edkolev/promptline.vim.git')
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


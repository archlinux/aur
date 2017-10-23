# Maintainer: Amos Onn <https://aur.archlinux.org/account/amos>

pkgname=vim-php-git
_gitname=php.vim
pkgver=r139.61292de
pkgrel=1
pkgdesc='Vim plugin for up-to-date php syntax'
arch=('any')
url='https://github.com/StanAngeloff/php.vim'
license=('none')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("git://github.com/StanAngeloff/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"scripts/syntax.ini"
  install -D -m644 {,"$_vimdir/"}"scripts/update-vim-syntax.php"
  install -D -m644 {,"$_vimdir/"}"syntax/${_gitname}"
}

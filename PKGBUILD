# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
pkgname=vim-cpp-enhanced-highlight-git
pkgver=r45.a8024aa
pkgrel=1
pkgdesc="Additional Vim syntax highlighting for C++ (including C++11/14)"
arch=('any')
url="https://github.com/octol-lang/vim-cpp-enhanced-highlight"
license=('None')
makedepends=('git')
source=('git://github.com/octol/vim-cpp-enhanced-highlight.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/vim-cpp-enhanced-highlight
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/vim-cpp-enhanced-highlight
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 after/syntax/c.vim "${vimfiles}/after/syntax/c.vim"
  install -D -m644 after/syntax/cpp.vim "${vimfiles}/after/syntax/cpp.vim"
}


# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=file-line
pkgname=vim-$_pkgname-git
pkgver=r72.9233f66
pkgrel=1
pkgdesc="Plugin for Vim to enable opening files with the file:line:column syntax"
arch=("any")
url="https://github.com/patnr/file-line"
license=("GPL3")
source=("git+https://github.com/patnr/file-line.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 "$srcdir/$_pkgname/plugin/file_line.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/file_line.vim"
  install -Dm 644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/README.md"
}

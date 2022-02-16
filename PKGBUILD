# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=vim-rooter
pkgname=$_pkgname-git
pkgver=r123.0415be8
pkgrel=1
pkgdesc="Changes Vim working directory to project root."
arch=("any")
url="https://github.com/airblade/vim-rooter"
license=("MIT")
source=("git+https://github.com/airblade/vim-rooter.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 "$srcdir/$_pkgname/plugin/rooter.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/rooter.vim"
  install -Dm 644 "$srcdir/$_pkgname/doc/rooter.txt" "$pkgdir/usr/share/vim/vimfiles/doc/rooter.txt"
}

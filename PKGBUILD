# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=i3-vim-syntax-git
pkgver=r23.a74c9bc
pkgrel=1
pkgdesc="Vim syntax for i3 window manager config"
arch=('any')
url="https://github.com/PotatoesMaster/i3-vim-syntax"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/i3-vim-syntax"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/i3-vim-syntax"

  local _vimfiles="$pkgdir/usr/share/vim/vimfiles"
  for dir in */
  do
    install -Dm644 "${dir}i3.vim" "$_vimfiles/${dir}i3.vim"
  done
}

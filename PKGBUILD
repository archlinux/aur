# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=vim-swap
pkgname=$_pkgname-git
pkgver=r223.9358bfd
pkgrel=1
pkgdesc="Reorder delimited items."
arch=("any")
url="https://github.com/machakann/vim-swap"
license=("unknown")
source=("git+https://github.com/machakann/vim-swap.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"

  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r "$_pkgname"/{autoload,doc,macros,plugin,test} "$pkgdir/usr/share/vim/vimfiles"
}

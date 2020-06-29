# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=vim-nftables
pkgname=$_pkgname-git
pkgver=r16.26f8a50
pkgrel=1
pkgdesc="vim nftables syntax"
arch=("any")
url="https://github.com/nfnty/vim-nftables"
license=("MIT")
makedepends=("git")
source=("git+https://github.com/nfnty/vim-nftables.git")
sha512sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  for dir in ftdetect ftplugin indent syntax; do
    install -Dm 644 \
      "$srcdir/$_pkgname/$dir/nftables.vim" \
      "$pkgdir/usr/share/vim/vimfiles/$dir/nftables.vim"
  done
}

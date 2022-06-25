# Maintainer: Aline Abler <alinea@riseup.net>
pkgname=vim-lolcode-git
pkgver=6.444af9b
pkgrel=2
pkgdesc="Vim syntax support for LOLCODE"
arch=('any')
url="https://github.com/Xe/lolcode.vim"
depends=('vim')
makedepends=('git')
provides=('vim-lolcode')
conflicts=('vim-lolcode')

source=("git+https://github.com/Xe/lolcode.vim.git")
md5sums=('SKIP')
_gitname="lolcode.vim"

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname

  for x in syntax ftdetect; do
    install -D -m644 $x/lolcode.vim "${pkgdir}/usr/share/vim/vimfiles/$x/lolcode.vim"
  done
} 

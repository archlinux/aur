# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-ferm-git
pkgver=r15.64b49c8
pkgrel=1
pkgdesc='Vim syntax highlighting for "ferm" filetype'
arch=('any')
url="https://github.com/cometsong/ferm.vim"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 644 {,"$pkgdir/usr/share/vim/vimfiles/"}ftdetect/ferm.vim
  install -Dvm 644 {,"$pkgdir/usr/share/vim/vimfiles/"}syntax/ferm.vim
}

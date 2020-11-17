# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=yang-vim
_pkgname=yang.vim
pkgver=r40.0edaeb6
pkgrel=1
pkgdesc="YANG syntax plugin for vim"
arch=('any')
url="http://github.com/nathanalderson/$_pkgname"
license=('GPL')
depends=('vim')
makedepends=('git')
source=("$pkgname::git+https://github.com/nathanalderson/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm 644 ftdetect/yang.vim "$pkgdir/usr/share/vim/vim82/ftdetect/yang.vim"
  install -Dm 644 ftplugin/yang.vim "$pkgdir/usr/share/vim/vim82/ftplugin/yang.vim"
  install -Dm 644 indent/yang.vim "$pkgdir/usr/share/vim/vim82/indent/yang.vim"
  install -Dm 644 syntax/yang.vim "$pkgdir/usr/share/vim/vim82/syntax/yang.vim"
}

# vim:set ts=2 sw=2 et:

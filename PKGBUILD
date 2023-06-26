# vim:set ts=2 sw=2 et:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=vim-monkey-c
pkgver=r6.2b3b5df
pkgrel=1
pkgdesc="Monkey C syntax highlighting"
arch=('any')
url=https://github.com/klimeryk/${pkgname}
license=('GPL')
depends=('vim')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  install -Dm0644 ftdetect/monkey-c.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/monkey-c.vim
  install -Dm0644 syntax/monkey-c.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/monkey-c.vim
}

# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=vim-todotxt-git
_pkgname=vim-todotxt
pkgver=r141.6845221
pkgrel=1
pkgdesc="Vim plugin for Todo.txt (git version)"
url="https://github.com/dbeniamine/todo.txt-vim"
depends=(vim)
conflicts=(vim-todotxt)
license=('unknown')
arch=('any')
source=("${pkgname}"::'git+https://github.com/freitass/todo.txt-vim.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
	install -d $pkgdir/usr/share/vim/vimfiles
	cp -a {autoload,doc,ftdetect,ftplugin,syntax} \
	  $pkgdir/usr/share/vim/vimfiles/
}

# vim:set ts=2 sw=2 et:

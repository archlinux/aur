# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=vim-todotxt-git
_pkgname=vim-todotxt
pkgver=r288.84b5ae6
pkgrel=1
pkgdesc="Vim plugin for Todo.txt (git version)"
url="https://gitlab.com/dbeniamine/todo.txt-vim"
depends=(vim)
conflicts=(vim-todotxt)
license=('unknown')
arch=('any')
install="${pkgname}.install"
source=("${pkgname}"::'git+https://gitlab.com/dbeniamine/todo.txt-vim')
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
  install -Dm644 README.markdown "${pkgdir}/usr/share/doc/${pkgname}/README.markdown"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=vim-coffeescript-git
pkgver=v003.6.g32fe889
pkgrel=1
pkgdesc="CoffeeScript syntax support for Vim."
arch=('any')
url="http://github.com/kchmck/vim-coffee-script"
license=('WTFPL')
depends=('vim')
makedepends=('git')
provides=('vim-coffeescript')
conflicts=('vim-coffeescript')
source=("git://github.com/kchmck/vim-coffee-script.git")
md5sums=('SKIP')
_gitname="vim-coffee-script"

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --long)"
  echo "${ver//-/.}"
}

package() {
  cd "$srcdir/$_gitname"

  for x in autoload compiler ftdetect ftplugin indent syntax; do
    install -D -m644 $x/coffee.vim "${pkgdir}/usr/share/vim/vimfiles/$x/coffee.vim"
  done
  install -D -m644 compiler/cake.vim "${pkgdir}/usr/share/vim/vimfiles/compiler/cake.vim"
  install -D -m644 after/indent/html.vim "${pkgdir}/usr/share/vim/vimfiles/after/indent/html.vim"
  install -D -m644 after/syntax/html.vim "${pkgdir}/usr/share/vim/vimfiles/after/indent/html.vim"
  install -D -m644 after/syntax/haml.vim "${pkgdir}/usr/share/vim/vimfiles/after/indent/haml.vim"
  install -D -m644 doc/coffee-script.txt "${pkgdir}/usr/share/vim/vimfiles/doc/coffee-script.txt"
  install -D -m644 Readme.md "${pkgdir}/usr/share/doc/vim-coffeescript/Readme.md"
}

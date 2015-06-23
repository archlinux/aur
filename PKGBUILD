# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
pkgname=vim-spacebars-git
pkgver=r63.9731a8d
pkgrel=1
pkgdesc="Spacebars, Mustache and Handlebars syntax support for Vim."
arch=('any')
url="https://github.com/Slava/vim-spacebars"
license=('custom')
makedepends=('git')
provides=('vim-spacebars')
conflicts=('vim-spacebars')
source=("git://github.com/Slava/vim-spacebars")
md5sums=('SKIP')
_gitname="vim-spacebars"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  for x in ftdetect ftplugin syntax; do
    install -D -m644 $x/spacebars.vim "${pkgdir}/usr/share/vim/vimfiles/$x/spacebars.vim" 
  done
  install -D -m644 README.md "${pkgdir}/usr/share/doc/vim-spacebars/README.md"
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
} 

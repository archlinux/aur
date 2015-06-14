# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net> awagner on irc.freenode.net
pkgname=vim-syntastic-git
pkgver=3.6.0_94_gb8682c3
pkgrel=1
pkgdesc="Syntax checking hacks for vim"
arch=('any')
url="https://github.com/scrooloose/syntastic"
license=('WTFPLv2')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git' 'rake')
provides=('vim-syntastic')
conflicts=('vim-syntastic')
install=vimdoc.install
source=("git+https://github.com/scrooloose/syntastic.git")
sha1sums=('SKIP')

pkgver() {
  cd syntastic
  echo $(git describe --tags | sed 's#-#_#g;s#v##')
}

package() {
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload/syntastic/,syntax_checkers}
  cd "$srcdir/syntastic"
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  cp doc/syntastic.txt $pkgdir/usr/share/vim/vimfiles/doc/
  cp autoload/syntastic/* $pkgdir/usr/share/vim/vimfiles/autoload/syntastic/
  cp -r syntax_checkers/* $pkgdir/usr/share/vim/vimfiles/syntax_checkers/
}

# vim:set ts=2 sw=2 et: 

# Maintainer: Anthony VanBerkum <anthonyvbop AT gmail DOT com>
pkgname=editorconfig-vim
pkgver=0.3.3
pkgrel=2
pkgdesc="EditorConfig plugin for Vim - editorconfig.org"
arch=("any")
url="https://github.com/editorconfig/editorconfig-vim"
license=("custom")
groups=("vim-plugins")
depends=("vim")
optdepends=("python: Python version of EditorConfig core"
            "editorconfig-core-c: compiled version of EditorConfig core")
install=vimdoc.install
source=("https://github.com/editorconfig/editorconfig-vim/archive/v0.3.3.tar.gz")
sha256sums=("fd579672c426a089835e9bc57a1fd5fc18dba77c014b67141153372e83c92c57")

package() {
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload}
  cd "$srcdir/$pkgname-$pkgver"
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  cp doc/editorconfig.txt $pkgdir/usr/share/vim/vimfiles/doc/
  cp autoload/editorconfig.vim $pkgdir/usr/share/vim/vimfiles/autoload/
  mkdir -p $pkgdir/usr/share/licenses/editorconfig-vim
  cp LICENSE $pkgdir/usr/share/licenses/editorconfig-vim
}

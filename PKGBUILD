# Maintainer: Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# https://github.com/avbop/editorconfig-vim-aur
pkgname=editorconfig-vim
pkgver=1.0.0_beta
pkgrel=1
pkgdesc="EditorConfig plugin for Vim - editorconfig.org"
arch=("any")
url="https://github.com/editorconfig/editorconfig-vim"
license=("custom")
groups=("vim-plugins")
depends=("vim")
optdepends=("python: Python version of EditorConfig core"
            "editorconfig-core-c: compiled version of EditorConfig core")
install=vimdoc.install
source=("https://github.com/editorconfig/editorconfig-vim/archive/v1.0.0-beta.tar.gz")
sha256sums=("2b2366f554af923ec13888c34ca8c53d95eee750801ea13c958b625a1d1f342d")

package() {
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload}
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  cp doc/editorconfig.txt $pkgdir/usr/share/vim/vimfiles/doc/
  cp -r autoload/* $pkgdir/usr/share/vim/vimfiles/autoload/
  mkdir -p $pkgdir/usr/share/licenses/editorconfig-vim
  cp LICENSE $pkgdir/usr/share/licenses/editorconfig-vim
}

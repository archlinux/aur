# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-notes
pkgver=0.23.4
pkgrel=1
pkgdesc='Easy note taking in Vim '
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3375'
_src_id=20744
license=('MIT')
groups=('vim-plugins')
depends=(python vim-misc-xolox)
conflicts=(vim-notes-git)
install='vimdoc.install'
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha256sums=('ceff55c50f25688406c227e7702fedc0cf193be0e7593bbd14178a4d34ba602a')
package(){
  cd "$srcdir"
  _vim_dir='/usr/share/vim/vimfiles'
  install -d "$pkgdir"/$_vim_dir

  tar -c ./ \
    --exclude $pkgname-$pkgver.zip \
    --exclude INSTALL.md \
    --exclude README.md \
    --exclude TODO.md \
    --exclude autoload/xolox/misc \
    --exclude .gitignore \
    --exclude addon-info.json \
    | tar -x -C "$pkgdir"/$_vim_dir
}

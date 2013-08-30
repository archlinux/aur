# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-eunuch
pkgver=1.0
_srcid=18948
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4300"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('e2280726aa8e6ee108d2e3f46f8a5fd3f206561ceae3faa8e10f4c5c4f31e9c5')
provides=('vim-eunuch')
conflicts=('vim-eunuch-git')
install=vimdoc.install

package() {
  cd "$srcdir"

  rm ${pkgname}.zip

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles
}

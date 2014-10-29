# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Andy Weidenbaum <archbaum at gmail.com>

pkgname=vim-eunuch
pkgver=1.1
_srcid=21847
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4300"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('687f615c3b7c204f14560d9df75ff20c310a49253152e2d72452682489707c8b')
provides=('vim-eunuch')
install=vimdoc.install

package() {
  cd "$srcdir"

  rm ${pkgname}.zip

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles
}

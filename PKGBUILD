# Maintainer: Vicente Reyes <vreyesvaldivieso at gmail dot com>

pkgname=vim-hoogle
pkgver=1.3
pkgrel=1
pkgdesc='Search haskell documentation from vim'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2672'
license=('unknown')
depends=('vim')
optdepends=('hoogle')
groups=('vim-plugins')
source=("$pkgname.vim::http://www.vim.org/scripts/download_script.php?src_id=15024")
install='vimdoc.install'
md5sums=('ce94fb9e77eb3d3f10bbd9df1834cdf7')

package() {
  cd "${pkgname}"
  # See https://github.com/Twinside/vim-hoogle/issues/10
  # I'm open to better solutions
  vim -c "set fileformat=unix|wq" plugin/hoogle.vim
  vim -c "set fileformat=unix|wq" doc/hoogle.vim

  install -Dm644 doc/hoogle.txt "${pkgdir}/usr/share/vim/vimfiles/doc/hoogle.txt"
  install -Dm644 plugin/hoogle.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/hoogle.vim"
}

# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=7.4
pkgrel=2
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=25736")
sha256sums=('7a8077df2875414abcbc001e172058d556ebb1867041096ea25876d9fa83b240')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
#  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

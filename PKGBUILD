# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=8.0
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=26254")
sha256sums=('d19ec89f09341144efc858c1edad57ec68d83e1f4ab8cd8d418c16343c928b07')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
#  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=6.8
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=25500")
sha256sums=('c05d4de1db8edaa8ab4f3bc56cafa5e139cce16d8adf1969cd08a8dd63bbdb1c')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
#  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

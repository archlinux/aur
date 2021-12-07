# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=8.91
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown') # no licence https://github.com/rickhowe/diffchar.vim/issues/3
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=27830")
sha256sums=('7fbef70c01f5ba3104e06ce5e41a531edc5b52ceb56a23ee6359f5ae95cacb0d')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
}

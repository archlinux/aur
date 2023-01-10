# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=9.3
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=28342"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/rickhowe/diffchar.vim/master/LICENSE")
sha256sums=('1c8c8e9d49fd3167bbe8b06af148f618ffb8de36081b23f7778dca7f640ac9da'
            '8f786990b7611d1208eb9b27c107e3f7c2b25da8d83f48488be63097bc7f529d')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"

  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

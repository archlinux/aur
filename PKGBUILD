# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=9.9
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=28966"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/rickhowe/diffchar.vim/master/LICENSE")
sha256sums=('eef3c73231b763762afcab569fae9875376d29801c96d6854a7091967fb076c4'
            '5af329891f9a80c2fc739b1ef6b3932a940db3953d5078ab0963e0007bce12cd')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"

  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

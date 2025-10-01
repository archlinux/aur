# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=10.0
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=29034"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/rickhowe/diffchar.vim/master/LICENSE")
sha256sums=('96e1bbc27ece4f9b83c8fe6a4838470ef6afee59a6f914ded0fc5986d8f1aca1'
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

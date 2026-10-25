# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=10.1
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=29255"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/rickhowe/diffchar.vim/master/LICENSE")
sha256sums=('0eac38cd04ed60c9922f7cde510a35dcb8171cfb67160da2a8317755cb105b81'
            '9a061ca684100f61ff5e218819805d6af3a49b2cd9ed55239ea44c56a2816266')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"

  install -Dm644 "$pkgname-$pkgver-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

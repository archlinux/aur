# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=8.1
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=26278")
sha256sums=('3b6f763b9216ac09eba6a6280540fe27cc567830fc25df29aa2d9dc10fed755f')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
#  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

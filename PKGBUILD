# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=8.8
pkgrel=1
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=27480")
sha256sums=('a035f3836d41a2612da380473a158c5e1a64b243596e211c70416d6f80a53fc9')

prepare() {
  rm doc/tags
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
#  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

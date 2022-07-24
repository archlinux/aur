# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-diffchar
pkgver=9.0
pkgrel=2
pkgdesc="Improve vim's diff mode, by finding exact differences between lines, character by character"
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4932'
license=('unknown') # no licence https://github.com/rickhowe/diffchar.vim/issues/3
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=28070"
        'https://github.com/rickhowe/diffchar.vim/commit/18e8d9e72b79041a13bce6d3ae95d3d3515e100a.patch')
sha256sums=('efa89d6c7b2a7beec78454bddd59324f55b59c2ebd08d22835235cb17315cbd1'
            'd0535d22e59606dae58bc1e7ae90efdd113220f154265b53ead384b21037a3b3')

prepare() {
  rm doc/tags
  patch -p1 -i "$srcdir/18e8d9e72b79041a13bce6d3ae95d3d3515e100a.patch"
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
}

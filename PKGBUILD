# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-sneak
pkgver=1.7.4
pkgrel=1
pkgdesc='The missing motion for Vim'
arch=('any')
url='https://github.com/justinmk/vim-sneak'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justinmk/vim-sneak/archive/${pkgver}.tar.gz")
sha512sums=('e9738b8e5fda3cb2d205e3c04778e25191c8850d283beafa9a798301c255cba7f777a21ed9514a4ccdc8f728246fcac248e61a4bb2eda934bc1284ef6af287ba')

package() {
  cd "${srcdir}/vim-sneak-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/sneak}
  install -D -m644 autoload/sneak/*.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/sneak/"
  install -D -m644 plugin/sneak.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/sneak.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"
}

# vim:set et sw=2 ts=2 tw=79:

# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-sneak
pkgver=1.8.1
pkgrel=1
pkgdesc='The missing motion for Vim'
arch=('any')
url='https://github.com/justinmk/vim-sneak'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justinmk/vim-sneak/archive/${pkgver}.tar.gz")
sha512sums=('1ad0f8542cf6ed9ab351d882723000789e60669f347e48bf7c4ccb010e344735b6cff313aabf6a5d2b11a85e1bd169c4beb2d16526914c0226a71cbc2384e401')

package() {
  cd "${srcdir}/vim-sneak-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/sneak}
  install -D -m644 autoload/sneak/*.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/sneak/"
  install -D -m644 plugin/sneak.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/sneak.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"
}

# vim:set et sw=2 ts=2 tw=79:

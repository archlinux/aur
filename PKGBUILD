# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-sneak
pkgver=1.8
pkgrel=1
pkgdesc='The missing motion for Vim'
arch=('any')
url='https://github.com/justinmk/vim-sneak'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justinmk/vim-sneak/archive/${pkgver}.tar.gz")
sha512sums=('176f2f90ca599625e920d0fddc393abe285ebe76717c0ca27ccb8ccc01a00f7c12800412662493ba8bd6c1e7d70f4629c574aad724a29526e7babc52dbfccad8')

package() {
  cd "${srcdir}/vim-sneak-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/sneak}
  install -D -m644 autoload/sneak/*.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/sneak/"
  install -D -m644 plugin/sneak.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/sneak.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"
}

# vim:set et sw=2 ts=2 tw=79:

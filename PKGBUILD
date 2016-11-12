# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-extline
pkgver=0.2.0
pkgrel=1
pkgdesc='Vim plugin for extending lines (e.g., underlined titles)'
arch=('any') 
url='https://github.com/drmikehenry/vim-extline'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
install="vimdoc.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drmikehenry/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2008c5a3d3c01041743aaf55b4ded31797550f886eb69bfb82a4d6bf769658ab8710126a77d05e04cae8ce4a36859ad683c0df1b3b0a17357948f0ed871f6127')

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload}
  find . -type d -exec chmod 755 '{}' \;
  cp -dr plugin/* "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -Dm0644 doc/extline.txt "${pkgdir}/usr/share/vim/vimfiles/doc/extline.txt"
  cp -r autoload/extline.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/"
}

# vim:set et sw=2 ts=2 tw=79:

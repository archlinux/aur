# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-devicons
pkgver=0.8.5
pkgrel=3
pkgdesc='Adds file type glyphs/icons to many popular Vim plugins such as: NERDTree, vim-airline, unite, vim-startify and many more'
arch=('any')
url='https://github.com/ryanoasis/vim-devicons'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanoasis/vim-devicons/archive/v${pkgver}.tar.gz")
sha512sums=('5212116d59d438ade193a4c82255e51c5be04e662765c9ddda372480c46680c3ddee726fa8fa8b8d1b3047e9c1435144e9c0847c63ee6ebd3c4eee943780ed37')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/vimfiler/columns,pythonx/vim_devicons,nerdtree_plugin,autoload/airline/extensions/tabline/formatters}
  find . -type d -exec chmod 755 '{}' \;
  cp plugin/* "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  cp nerdtree_plugin/webdevicons.vim "${pkgdir}/usr/share/vim/vimfiles/nerdtree_plugin/webdevicons.vim"
  install -Dm0644 doc/webdevicons.txt "${pkgdir}/usr/share/vim/vimfiles/doc/webdevicons.txt"
  cp autoload/airline/extensions/tabline/formatters/webdevicons.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/airline/extensions/tabline/formatters/webdevicons.vim"
  cp autoload/vimfiler/columns/devicons.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/vimfiler/columns/devicons.vim"
  cp -dr pythonx/* "${pkgdir}/usr/share/vim/vimfiles/pythonx/"
}

# vim:set et sw=2 ts=2 tw=79:

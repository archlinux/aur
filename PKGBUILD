# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-devicons
pkgver=0.8.3
pkgrel=1
pkgdesc='Adds file type glyphs/icons to many popular Vim plugins such as: NERDTree, vim-airline, unite, vim-startify and many more'
arch=('any')
url='https://github.com/ryanoasis/vim-devicons'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install="vimdoc.install"
source=("https://github.com/ryanoasis/vim-devicons/archive/v${pkgver}.tar.gz")
sha512sums=('0295304c02bad3455de52b475ec232d7252e81e83b664f6e5a3a2b516a9a99c7e8b628ed8fb3c9268ba8ac82a8f00060b4a43b58a99593593accdf4b9094bc1e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/vimfiler/columns,pythonx/vim_devicons,nerdtree_plugin,autoload/airline/extensions/tabline/formatters}
  find . -type d -exec chmod 755 '{}' \;
  cp plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
  cp nerdtree_plugin/webdevicons.vim "${pkgdir}/usr/share/vim/vimfiles/nerdtree_plugin/webdevicons.vim"
  install -Dm0644 doc/webdevicons.txt "${pkgdir}/usr/share/vim/vimfiles/doc/webdevicons.txt"
  cp autoload/airline/extensions/tabline/formatters/webdevicons.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/extensions/tabline/formatters/webdevicons.vim"
  cp autoload/vimfiler/columns/devicons.vim "$pkgdir/usr/share/vim/vimfiles/autoload/vimfiler/columns/devicons.vim"
  cp -dr pythonx/* "${pkgdir}/usr/share/vim/vimfiles/pythonx/"
}

# vim:set et sw=2 ts=2 tw=79:

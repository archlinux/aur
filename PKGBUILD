# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-table-mode
pkgver=4.6.4
pkgrel=1
pkgdesc='VIM Table Mode for instant table creation. '
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
install="vimdoc.install"
source=("https://github.com/dhruvasagar/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('17ad617ee918eb5a865749a62a4955783bbf72191946112fac7cdde141372689a726f94e805f62f74285f623e97cb0d677fb86cb4c5beca27fc4483175cf7295')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/tablemode}
  find . -type d -exec chmod 755 '{}' \;
  cp -dr plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dm0644 doc/table-mode.txt "${pkgdir}/usr/share/vim/vimfiles/doc/table-mode.txt"
  cp -r autoload/tablemode/* "$pkgdir/usr/share/vim/vimfiles/autoload/tablemode/"
  cp autoload/tablemode.vim "$pkgdir/usr/share/vim/vimfiles/autoload/"
}

# vim:set et sw=2 ts=2 tw=79:

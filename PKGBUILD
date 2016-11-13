# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-table-mode
pkgver=4.6.4.2
pkgrel=1
pkgdesc='VIM Table Mode for instant table creation.'
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhruvasagar/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ccd001d7b06b007387d6c04e94e8016d4fddc91ba8b994fdb0b4607904189a89288236fa6794759218262fbc262ce60b1734586c3c4bd3ab5a0eda076161ebf9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/tablemode}
  find . -type d -exec chmod 755 '{}' \;
  cp -dr plugin/* "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -Dm0644 doc/table-mode.txt "${pkgdir}/usr/share/vim/vimfiles/doc/table-mode.txt"
  cp -r autoload/tablemode/* "${pkgdir}/usr/share/vim/vimfiles/autoload/tablemode/"
  cp autoload/tablemode.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/"
}

# vim:set et sw=2 ts=2 tw=79:

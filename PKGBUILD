# Maintainer: Vlad Petrov ejiek@mail.ru
pkgname=vim-table-mode
pkgver=4.7.3
pkgrel=1
pkgdesc='VIM Table Mode for instant table creation.'
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhruvasagar/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d7a477272dcd6fcc21b6f9bacacf6f896132367873280377ad7381a39241adf8209765781de210701ee4e6df9af8f5e9edf7d186be2a605f4cd1ac4119665790')

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

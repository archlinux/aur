# Maintainer: Vlad Petrov ejiek@mail.ru
pkgname=vim-table-mode
pkgver=4.6.7
pkgrel=1
pkgdesc='VIM Table Mode for instant table creation.'
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhruvasagar/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('bc0f1970a61751dc9df5c2fcfdf17008e700722234a33f2a35726279b90b4e8cf71beeb7b11e93a6c02ec9f57958dd9e33837c69cc2475c767bd279560700d81')

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

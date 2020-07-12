# Maintainer: Anton Karmanov <bergentroll@insiberia.net>
pkgname=vim-python-pep8-indent
pkgver=r145.60ba5e1
pkgrel=1
pkgdesc='Vim plugin to improve Python indentation'
url='https://github.com/Vimjas/vim-python-pep8-indent'
arch=('any')
license=('custom:Public Domain')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  install -Dm 644 COPYING.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm 755 "${pkgdir}/usr/share/vim/vimfiles/"
  cp -dr --no-preserve=ownership indent "${pkgdir}/usr/share/vim/vimfiles/"
}

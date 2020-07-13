# Maintainer: Anton Karmanov <bergentroll@insiberia.net>

_upstream_name=vim-python-pep8-indent
pkgname="${_upstream_name}-git"
pkgver='r145.60ba5e1'
pkgrel=1
pkgdesc='Vim plugin to improve Python indentation'
url='https://github.com/Vimjas/vim-python-pep8-indent'
arch=('any')
license=('custom:Public Domain')
depends=('vim')
makedepends=('git')
conflicts=('vim-python-pep8-indent')
groups=('vim-plugins')
source=("${_upstream_name}::git+${url}")
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd ${_upstream_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_upstream_name}
  install -Dm 644 COPYING.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm 755 "${pkgdir}/usr/share/vim/vimfiles/"
  cp -dr --no-preserve=ownership indent "${pkgdir}/usr/share/vim/vimfiles/"
}

# Maintainer: olddog <jeff@impcode.com>

pkgname=vim-gutentags-git
pkgver=r244.4814b67
pkgrel=1
pkgdesc='A Vim plugin that manages your tag files'
arch=('any')
url='https://bolt80.com/gutentags/'
license=('MIT')
makedepends=('git')
groups=('vim-plugins')
depends=('vim-runtime')
source=("git+https://github.com/ludovicchabant/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r autoload doc plugin res plat "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: DanManN <dnahimov@gmail.com>

pkgname=vim-razer-git
pkgver=1.0
pkgrel=3
pkgdesc="Makes RGB Razer keyboards change key colors to complement what you do in vim."
arch=('any')
url='https://github.com/DanManN/vim-razer'
license=('GNU GPLv3')
depends=('vim' 'openrazer-meta')
makedepends=('git')
conflicts=('vim-razer')
provides=('vim-razer')
groups=('vim-plugins')
source=("git+https://github.com/DanManN/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r doc plugin "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

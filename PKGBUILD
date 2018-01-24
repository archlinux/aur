# Maintainer: DanManN <dnahimov@gmail.com>

_prgname=vim-razer
pkgname=neo${_prgname}-git
pkgver=1.1.r8.g019f1a5
pkgrel=1
pkgdesc="Makes RGB Razer keyboards change key colors to complement what you do in neovim."
arch=('any')
url='https://github.com/DanManN/vim-razer'
license=('GNU GPLv3')
depends=('neovim' 'python-neovim' 'openrazer-meta')
makedepends=('git')
optdepends=('polychromatic')
conflicts=('neovim-razer')
provides=('neovim-razer')
groups=('neovim-plugins')
source=("git+https://github.com/DanManN/${_prgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_prgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_prgname}"
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  mkdir -p "${_installpath}"
  cp -r doc plugin "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

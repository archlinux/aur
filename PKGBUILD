# Maintainer: xtheosirian <https://aur.archlinux.org/account/xtheosirian>

pkgname=vim-lalrpop-git
pkgver=r2.7073eec
pkgrel=1
pkgdesc="LALRPOP Vim plugin with minimal syntax-highlighting functionality."
arch=('any')
url='https://github.com/qnighy/lalrpop.vim'
license=('MIT' 'APACHE')
depends=('vim' 'vim-rust-git')
makedepends=('git')
conflicts=('vim-lalrpop')
provides=('vim-lalrpop')
groups=('vim-plugins')
source=("git+https://github.com/qnighy/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r ftdetect syntax "${_installpath}"
  install -D -m644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

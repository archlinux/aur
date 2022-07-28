# Maintainer: NBonaparte <nbonaparte@protonmail.com>

_name='zig.vim'
pkgname=vim-zig-git
pkgver=r155.3538ae9
pkgrel=1
epoch=1
pkgdesc="Vim configuration for Zig"
arch=('any')
url='https://github.com/ziglang/zig.vim'
license=('MIT')
depends=('vim')
optdepends=('zig')
makedepends=('git')
conflicts=('vim-zig')
provides=('vim-zig')
groups=('vim-plugins')
source=("git+https://github.com/ziglang/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/"${_name}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r */ "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


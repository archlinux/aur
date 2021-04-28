# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-fix-cursorhold-git
pkgver=r6.b5158c9
pkgrel=1
pkgdesc="A neovim plugin to fix CursorHold performance issues"
arch=('any')
url="https://github.com/antoinemadec/fixcursorhold.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 644 plugin/fix_cursorhold_nvim.vim -t "$pkgdir/usr/share/nvim/runtime/plugin/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

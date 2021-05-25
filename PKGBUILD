# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-move-git
pkgver=1.4.r63.g1460aa9
pkgrel=1
pkgdesc="Vim plugin to move lines and selections up and down"
arch=('any')
url="https://github.com/matze/vim-move"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  install -Dvm 644 doc/move.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
  install -Dvm 644 plugin/move.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

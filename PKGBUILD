# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-off-git
pkgver=r18.b06aa1b
pkgrel=1
pkgdesc="A no-color scheme for Vim"
arch=('any')
url="https://github.com/pbrisbin/vim-colors-off"
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 644 colors/off.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

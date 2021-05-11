# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-amora-git
pkgver=r43.c7a0000
pkgrel=1
pkgdesc="A modern colorscheme based on Dracula and Gruvbox Material"
arch=('any')
url="https://github.com/owozsh/amora"
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
  install -Dvm 644 colors/amora.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

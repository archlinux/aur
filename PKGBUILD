# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-oceanic-material-git
pkgver=r104.900f487
pkgrel=1
pkgdesc="Oceanic Material colorscheme for Vim"
arch=('any')
url="https://github.com/glepnir/oceanic-material"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 644 colors/oceanic_material.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

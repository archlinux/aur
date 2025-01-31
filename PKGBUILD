# Maintainer: dringsim <dringsim@qq.com>

pkgname=vim-cppman-git
pkgver=r3.1fe1106
pkgrel=1
pkgdesc="Read Cppman/Man pages right inside your vim."
arch=('any')
depends=('vim' 'cppman')
makedepends=('git')
url="https://github.com/skywind3000/vim-cppman"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/skywind3000/vim-cppman)
sha256sums=('SKIP')
provides=('vim-cppman')
conflicts=('vim-cppman')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-git}

  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership plugin "$pkgdir/usr/share/vim/vimfiles/plugin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}



# Maintainer: Maciej Balajewicz <mbalajew at illinois dot edu>

pkgname=vim-solarized8-git
pkgver=0.4
pkgrel=1
pkgdesc="Optimized Solarized colorschemes. Best served with true-color terminals!"
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('vim')
conflicts=('vim-solarized8')
provides=('vim-solarized8')
source=("$pkgname::git://github.com/lifepillar/vim-solarized8.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local _tmpver="$(git log -n 1 --format="%cd" --date=short)"
  echo "${_tmpver//-/}"
}

package() {
  cd "$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles/colors"
  install -Dm644 colors/* "$pkgdir/usr/share/vim/vimfiles/colors/"
}

# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=vim-terminus-git
_pkgname=${pkgname%-git}
pkgver=81
pkgrel=1
pkgdesc="Enhanced terminal integration for Vim"
arch=(any)
url="https://github.com/wincent/terminus.git"
license=('GPL')
source=("$_pkgname"::"git+$url")
md5sums=('SKIP')
depends=(vim-plugin-runtime)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}
package() {
   cd "$srcdir"/"$_pkgname"
   mkdir -p "$pkgdir"/usr/share/vim/vimfiles/
   cp -Rt "$pkgdir"/usr/share/vim/vimfiles plugin autoload
}

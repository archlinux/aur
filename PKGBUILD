# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=tabview-git
pkgver=r33.d0d3417
pkgrel=1
pkgdesc="Curses CSV/tabular data viewer"
arch=('any')
url="https://github.com/firecat53/tabview"
license=('GPL')
conflicts=('tabview')
provides=('tabview')
depends=('python')
makedepends=('git')
source=("git://github.com/firecat53/tabview.git")
_gitname="tabview"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  ./setup.py install --root=${pkgdir} --optimize=1 || return 1
}

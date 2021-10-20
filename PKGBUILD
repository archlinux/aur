# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=tabview-git
pkgver=r226.77846ac
pkgrel=1
pkgdesc="Curses CSV/tabular data viewer"
arch=('any')
url="https://github.com/tabviewer/tabview"
license=('MIT')
conflicts=('tabview')
provides=('tabview')
depends=('python')
makedepends=('git')
source=("git+https://github.com/tabviewer/tabview.git")
_gitname="tabview"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python setup.py build
}
  
package() {
  cd "$_gitname"
  python setup.py install --root=${pkgdir} --optimize=1
}

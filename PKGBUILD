# Maintainer: Ewen Le Bihan <hey@ewen.works>

pkgname=ideaseed-git
pkgver=r375.d4ea7df
pkgrel=1
pkgdesc="Note down your ideas and get them to the right place, without switching away from your terminal (bleeding edge)"
arch=('any')
url="https://github.com/ewen-lbh/ideaseed"
license=('MIT')
depends=('python')
makedepends=('git' "python-pip")
source=("git+https://github.com/ewen-lbh/ideaseed")
md5sums=('SKIP')

_gitname=ideaseed

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  sed -i "s/ideaseed v{version}/ideaseed v{version} (bleeding edge: $pkgver)/" $_gitname/ideaseed/ui.py
  pip install $_gitname/ --prefix=usr/ --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:


# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Tyler Harper <tyler@cowboycoding.net>

_gitname="pystache"
pkgname=python-pystache-git
pkgver=20091121
pkgrel=1
pkgdesc="The mustache template engine written in python"
arch=(any)
url="http://github.com/defunkt/pystache"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('python-pystache')
conflicts=('python-pystache')
source=( "git+$url" )
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

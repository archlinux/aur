# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Tyler Harper <tyler@cowboycoding.net>

_gitname=pystache
pkgname=python2-pystache-git
pkgver=1057.6a54b9a
pkgrel=2
pkgdesc="The mustache template engine written in python"
arch=(any)
url="https://github.com/defunkt/pystache"
license=('MIT')
depends=('python2')
makedepends=('git')
provides=('python2-pystache')
conflicts=('python2-pystache')
source=( "git+$url" )
md5sums=( 'SKIP' )

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

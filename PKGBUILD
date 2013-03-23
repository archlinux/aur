# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl-git
_pkgname=python-efl
pkgver=20130322
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('elementary-git' 'python')
provides=('python-efl-svn')
conflicts=('python-efl-svn')
makedepends=('git' 'cython')
source=("git://git.enlightenment.org/bindings/python/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(grep -m 1 "version =" setup.py | awk -F \" '{print $2}').$(git rev-list --count HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  
  python setup.py install --root="$pkgdir"
}

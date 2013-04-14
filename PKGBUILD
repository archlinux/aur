# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl-git
_pkgname=python-efl
pkgver=1.7.99.198.0fae488
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('elementary-git' 'python-dbus')
provides=('python-efl-svn')
conflicts=('python-efl-svn')
makedepends=('git' 'cython')
source=("git://git.enlightenment.org/bindings/python/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(awk -F \" '/version =/ {print $2}' setup.py).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  
  python setup.py install --root="$pkgdir"
}

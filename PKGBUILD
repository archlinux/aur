# Packager: Berényi Alexander
# Maintainer: Berényi Alexander

_pkgname=ttrss-python
pkgname=python-$_pkgname-git
pkgver=0.5.r8.g3d2d26d
pkgrel=1
pkgdesc="A python library for the Tiny Tiny RSS web API"
arch=('any')
url='https://ttrss-python.readthedocs.io'
license=('MIT')
depends=('python-requests')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/Vassius/ttrss-python.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# Packager: Berényi Alexander
# Maintainer: Berényi Alexander

_pkgname=python-scrapinghub
pkgname=$_pkgname-git
pkgver=2.1.1.r8.g8319db9
pkgrel=1
pkgdesc="A client interface for Scrapinghub's API"
arch=('any')
url='https://python-scrapinghub.readthedocs.io/'
license=('MIT')
depends=('python-msgpack' 'python-requests' 'python-retrying' 'python-six')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/scrapinghub/python-scrapinghub.git')
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

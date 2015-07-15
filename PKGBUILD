# Maintainer: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

_pkg="fs"

pkgname=python2-$_pkg
pkgver=0.5.1
pkgrel=2
pkgdesc="Filesystem abstraction"
arch=(any)
url="http://code.google.com/p/pyfilesystem/"
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/${_pkg:0:1}/$_pkg/$_pkg-${pkgver}.tar.gz")
md5sums=('7abd892a7534cab3a81775b92ca949ad')

package() {
    cd "$srcdir/$_pkg-$pkgver"
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}


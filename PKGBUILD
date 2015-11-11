# Maintainer: NeroBurner <pyro4hell at gmail dot com>

_pkgname=pykalman
pkgname=python-$_pkgname
pkgver=0.9.5
pkgrel=1
pkgdesc="Kalman Filter, Smoother, and EM Algorithm for Python"
arch=("any")
license=("BSD")
url="https://pykalman.github.io/"
depends=("python" "python-numpy" "python-scipy")
optdepends=("python-sphinx: for generating documentation"
            "python-numpydoc: for generating documentation"
            "python-nose: for runnung tests")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/p/pykalman/$_pkgname-$pkgver.tar.gz")
#source=("v$pkgver.tar.gz")  # for local testing
md5sums=('8baa2921cdfd2a5193ac67e23c2f7e5e')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

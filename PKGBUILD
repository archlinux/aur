# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xray'
pkgver=0.5
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="https://pypi.python.org/pypi/xray"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pandas')
optdepends=('python-netcdf4: NetCDF4 support'
            'python-bottleneck: Faster NaN operations'
            'python-cyordereddict: Speed up most internal operations'
            'python-scipy: OPeNDAP support')
checkdepends=('python-nose')
#source=(https://pypi.python.org/packages/source/x/xray/xray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/xray/xray/archive/v"$pkgver".tar.gz)
md5sums=('0e174bc96e9865991ed12ef168db2d2c')
sha1sums=('09da586db3e2cc97130030a2d70b8f6c052cd03a')
sha256sums=('7e90a9e6c32d38e7623cf756da7f2d568014a18395a1485b5478bb27a0a8488b')
 
build() {
  cd "$srcdir/xray-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/xray-$pkgver"
  nosetests
}
 
package() {
  cd "$srcdir/xray-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

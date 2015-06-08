# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xray'
pkgver=0.4.1
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="https://pypi.python.org/pypi/xray"
arch=('any')
license=('Apache')
makedepends=('python2-setuptools')
depends=('python2-numpy' 'python2-pandas')
optdepends=('python2-netcdf4: NetCDF4 support'
            'python2-bottleneck: Faster NaN operations'
            'python2-cyordereddict: Speed up most internal operations'
            'python2-scipy: OPeNDAP support')
checkdepends=('python2-nose')
#source=(https://pypi.python.org/packages/source/x/xray/xray-"$pkgver".tar.gz)
# I'm using the Github source instead of the PyPI source since the Github source includes the data files used for testing
source=(https://github.com/xray/xray/archive/v"$pkgver".tar.gz)
md5sums=('b124d83249156c60de73dafc5be712e8')
 
build() {
  cd "$srcdir/xray-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/xray-$pkgver"
  nosetests2
}
 
package() {
  cd "$srcdir/xray-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

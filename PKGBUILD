# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-xray'
pkgver=0.6.0
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
md5sums=('b9baf91aa9f6f062eb22bc99b4fe2745')
sha1sums=('3241c32884f4ca78244c1071ab0035e63e8bb557')
sha256sums=('556e3245ff598e2ec789c8212c622060db54f6ebfe1346dbb5439bf704ae5742')
 
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

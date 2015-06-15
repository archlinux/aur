# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-xray'
pkgver=0.5.1
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
md5sums=('5db1bc8ec91995adfd9a7edb5e99ed60')
sha1sums=('8d102654c56c12d7d6e6ace75bff12cc4eb92b4b')
sha256sums=('44e419a27981c91bed6bdd1ba6751cba5c0ac3be5071f9e505cf0fa3c0d0fe34')
 
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

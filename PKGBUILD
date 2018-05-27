# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=Py6S
pkgname=('python2-py6s')
pkgver=1.7.0
pkgrel=1
pkgdesc="Python 2.7 interface to the 6S Radiative Transfer Model"
arch=('any')
url='http://py6s.rtwilson.com'
license=('LGPL')
makedepends=('python2-setuptools')
depends=('6sv11' 'python2-scipy' 'python2-matplotlib' 'python2-pysolar')
optdepends=('python2-pandas: AERONET data file support')
options=(!emptydirs)
sha256sums=('e16cc28e54a59d3908b3902744d261046630e6811cb50b6a13e746f68d421b8b')
_pypi='https://files.pythonhosted.org/packages'
_path='1c/ea/fdb4fe3e289e3c14e3bdc473f6b6f595ceb476399600fab21c92db97c82a'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/$_name-$pkgver" \
       -name "*.py" \
       -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=Py6S
pkgname=('python2-py6s')
pkgver=1.6.2
pkgrel=1
pkgdesc="Python 2.7 interface to the 6S Radiative Transfer Model"
arch=('any')
url='http://py6s.rtwilson.com'
license=('LGPL')
makedepends=('python2-setuptools')
depends=('6sv11' 'python2-scipy' 'python2-matplotlib' 'python2-pysolar')
optdepends=('python2-pandas: AERONET data file support')
options=(!emptydirs)
md5sums=('41361f2bac39a1e9fbb11eb2a669b996')
_pypi='https://pypi.python.org/packages'
_path='8b/94/3feb8dd90ddfa4eeb9c5f73c1301c9642926b3fbbe074bae52cd71ba9d90'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz#md5=$md5sums")

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

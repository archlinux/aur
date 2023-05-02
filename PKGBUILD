pkgname=python-blosc2
_pkgname=blosc2
pkgver=2.2.0
pkgrel=2
pkgdesc='Wrapper for the blosc2 compressor'
arch=('any')
url='https://github.com/Blosc/python-blosc2'
license=('BSD')
depends=('python' 'python-setuptools' 'python-scikit-build' 'python-msgpack' 'python-ndindex' 'python-py-cpuinfo' 'python-rich' 'python-pytest' 'python-scipy' 'python-numpy' 'cmake' 'python-ndindex' 'blosc2')
source=("https://github.com/Blosc/python-blosc2/archive/refs/tags/v$pkgver.tar.gz")
#source=("https://files.pythonhosted.org/packages/b6/20/5141526d669b68e7530f417f55771e4bb0bd81fe6e78ccd851d6bae353ba/$_pkgname-$pkgver.tar.gz")
sha256sums=('b3f12d8ac9f3cdd16b27813d423dee3cd108a162f3a075d59d1325e0f3c27412')

build() {
  cd "$_pkgname-$pkgver"
  export CMAKE_ARGS="-DUSE_SYSTEM_BLOSC2=ON"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}


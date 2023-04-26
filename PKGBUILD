pkgname=python-blosc2
_pkgname=blosc2
pkgver=2.2.0
pkgrel=1
pkgdesc='Wrapper for the blosc2 compressor'
arch=('any')
url='https://github.com/Blosc/python-blosc2'
license=('BSD')
depends=('python' 'python-setuptools' 'python-scikit-build' 'python-msgpack' 'python-ndindex' 'python-py-cpuinfo' 'python-rich' 'python-pytest' 'python-scipy' 'python-numpy' 'cmake' 'python-ndindex')
conflicts=('blosc2')
provides=('blosc2')
#source=("https://github.com/Blosc/python-blosc2/archive/refs/tags/v$pkgver.tar.gz") # git tarball does not contain required submodules...
source=("https://files.pythonhosted.org/packages/b6/20/5141526d669b68e7530f417f55771e4bb0bd81fe6e78ccd851d6bae353ba/$_pkgname-$pkgver.tar.gz")
sha256sums=('4cf3893fe85da4bd899ecf7a457fd09b2212fad256182100108de7a92b88aa87')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-buil
}


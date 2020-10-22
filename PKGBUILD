# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=readabledelta
_commit=608c46d737a22711d03083adb6baf30592715d31
pkgname=python-readabledelta
pkgver=0.0.2
pkgrel=1
pkgdesc="Human readable modification of timedelta"
arch=('any')
url="https://pypi.org/project/readabledelta/"
license=('Unlicense')
depends=('python' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wimglenn/readabledelta/archive/${_commit}.zip")
sha256sums=('97940af7e611780e14a8a7728414cc32f8b83423714703155b26d716924d979a')

check() {
  cd $srcdir/${_pkgname}-${_commit}
  PYTHONPATH=. python test_readabledelta.py
}

build() {
  cd $srcdir/${_pkgname}-${_commit}
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${_commit}"
  python3 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

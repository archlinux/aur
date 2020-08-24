# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=5.0.2
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/${_pythonname}"
license=('MIT')
depends=('python' 'python-jsonpickle' 'python-ordered-set')
makedepends=('python-setuptools')
optdepends=('python-mmh3: murmurhash3 for faster hashing')
source=("https://pypi.io/packages/source/d/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('1d1484d74f22a43b32db7f6806509d7dd96bb8c7')
sha256sums=('e2b74af4da0ef9cd338bb6e8c97242c1ec9d81fcb28298d7bb24acdc19ea79d7')
sha512sums=('2211903eefc49cdd4d926c2e3a83fe1e6d7891404a35e10e73be9dc7801d2b6d83f30630e501658c67450ed014227c5d13c3b19489fbb34b3afa836369d5f8f5')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


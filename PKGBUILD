# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=5.2.2
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/${_pythonname}"
license=('MIT')
# The last version of DeepDiff to work on Python 3.5 was DeepDiff 5.0.2
depends=('python>=3.6' 'python-jsonpickle' 'python-ordered-set')
makedepends=('python-setuptools')
optdepends=('python-mmh3: murmurhash3 for faster hashing')
source=("https://pypi.io/packages/source/d/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('1a7ec41f1efaf0fd9ed8889498aa9d4369a89e81')
sha256sums=('752995dbd23e9971571c9f45b0bba9462cad3e968a505d644de492d6ff47d4fa')
sha512sums=('dbe270f3feefc97bfcaa17b6a5b6a57a71d0c4cb9f1a4a4fdacbd2b9fdc6a76dc7e091ec0221ac11cbed8dfe0cf051a4b6ce05097d59b102667cccce4b65517f')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


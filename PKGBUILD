# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=5.2.1
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
sha1sums=('231384bb8a94ad8146cc06d78176c3faa6a1866c')
sha256sums=('2e368943dc257f6fa93d9ce4537dbcd4fea65098208a0f49f675cf40132c1a89')
sha512sums=('6a26ca89f71ebacf4e706ea77500fcc9185da123e9cb22b409e16ec8d56fe40654c076ccf64421501fd7b9f70101cbc0ce69af81d44356ca693b1802851bfcdc')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


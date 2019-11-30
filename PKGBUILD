# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=4.0.9
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/${_pythonname}"
license=('MIT')
depends=('python' 'python-jsonpickle' 'python-ordered-set')
optdepends=('python-mmh3: murmurhash3 for faster hashing')
source=("https://pypi.io/packages/source/d/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('d87779ca5ed3409e7c5a60136140b39acaf1cf08')
sha256sums=('5e2343398e90538edaa59c0c99207e996a3a834fdc878c666376f632a760c35a')
sha512sums=('61238cd97d47b5c25e7e840681399de5538c1e7f48657a4f95748f90c276fd2badc48a71ad0280d22376094d5de875bad354c72867f3406dc6999ae8cbb0e7ae')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


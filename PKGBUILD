# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=5.2.3
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
sha1sums=('0033c4800c68b0076d20389b0ac17760a11e11e6')
sha256sums=('ae2cb98353309f93fbfdda4d77adb08fb303314d836bb6eac3d02ed71a10b40e')
sha512sums=('48a534fc4cdcc41ec46471d60223c7f53bcc04b01d4a5f72dad47332124cc2186f79f904148b25a325ce4936ac6fe68bc267893b0e99b32599fb0d009b71e0a5')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


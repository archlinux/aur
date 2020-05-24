# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
_pythonname=deepdiff
pkgname=python-${_pythonname}
pkgver=4.3.2
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects. It will recursively look for all the changes."
arch=('any')
url="https://github.com/seperman/${_pythonname}"
license=('MIT')
depends=('python' 'python-jsonpickle' 'python-ordered-set')
makedepends=('python-setuptools')
optdepends=('python-mmh3: murmurhash3 for faster hashing')
source=("https://pypi.io/packages/source/d/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")
sha1sums=('2d9d4373e140e77230827f081b033eec4ed3924d')
sha256sums=('91360be1d9d93b1d9c13ae9c5048fa83d9cff17a88eb30afaa0d7ff2d0fee17d')
sha512sums=('ca68a09a8be5d94fddf5e86c08398fa5b907255a4a58dc60613f15ae52411e6a286a17a758f5b7e0dda07f84ba1f74478a56ae97125cf7a9d33e47a7e1ed3a63')

build() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


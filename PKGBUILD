# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-dhash
pkgver=1.3
pkgrel=3

pkgdesc="Python library to calculate the difference hash (perceptual hash) for a given image, useful for detecting duplicates"
url="https://github.com/Jetsetter/dhash"
license=('MIT')

arch=('any')
makedepends=('python-setuptools')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("e6c8cd09d330f1ac44d3c9735d6b2a637d713dcb6b6091e340f91dda2484acb8")

build() {
   cd "$srcdir"/${_name}-$pkgver
   python setup.py build
}

package() {
   cd ${_name}-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}

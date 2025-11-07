# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=zombie-imp
pkgname=python-${_pkgname}
pkgver=0.0.3
pkgrel=2
pkgdesc='A copy of the imp module that was removed in Python 3.12'
arch=('any')
url='https://github.com/encukou/zombie-imp'
license=('PSF-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/encukou/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('483b258b3f6e4ae9c9fb87e86002c42782eec8604e44612e5f08eaa92241e905120add23ff5166949f565d6f67d0ebd4f25f3494d7447461cc8c4201399c2181')

build() {
  cd $_pkgname-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

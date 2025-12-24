# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=zombie-imp
pkgname=python-${_pkgname}
pkgver=0.0.4
pkgrel=1
pkgdesc='A copy of the imp module that was removed in Python 3.12'
arch=('any')
url='https://github.com/encukou/zombie-imp'
license=('PSF-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/encukou/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('03212d32abd41d58d08fcafdaa77ba5fe951ec75ca1558a45e6cd17f344cefdbf92fb487e401f17c43a4835dbca0bab49fff60fc9e5afb561b39a74d87fbf14c')

build() {
  cd $_pkgname-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

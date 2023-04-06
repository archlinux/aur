# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='python-pyffms2'
pkgver=0.4.5.5
pkgrel=2
pkgdesc='pyffms2 – Python bindings for FFMS2'
arch=('any')
url='https://github.com/bubblesub/pyffms2/'
license=('LGPL3')
depends=('python' 'ffms2' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("pyffms2-${pkgver}.tar.gz::https://github.com/bubblesub/pyffms2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bc06b2f0460a05e542f7612d05a10b9954ac99c392674f94adbb89e2bcdb3571')

build() {
  cd pyffms2-${pkgver}/
  python -m build --wheel --no-isolation
}

check() {
  cd pyffms2-${pkgver}/
  export PYTHONPATH="."
  python -m unittest
}

package() {
  cd pyffms2-${pkgver}/
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name='namex'
pkgname=("python-${_name}")
pkgdesc='A simple utility to separate the implementation of your Python package and its public API.'
url='https://github.com/fchollet/namex'
license=('Apache-2.0')
pkgver=0.1.0
pkgrel=1
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python')
sha256sums=('117f03ccd302cc48e3f5c58a296838f6b89c83455ab8683a1e85f2a430aa4306')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

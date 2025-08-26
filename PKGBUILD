# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=types-paramiko
pkgname=python-${_name}
pkgver=4.0.0.20250822
pkgrel=1
pkgdesc="Typing stubs for paramiko."
arch=(any)
url="https://github.com/python/typeshed/tree/main/stubs/paramiko"
license=('Apache-2.0')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python>=3.9' 'python-cryptography')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/types_paramiko/types_paramiko-${pkgver}.tar.gz")
sha256sums=('1b56b0cbd3eec3d2fd123c9eb2704e612b777e15a17705a804279ea6525e0c53')

build() {
  cd "${srcdir}"/types_paramiko-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/types_paramiko-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}


# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=types-paramiko
pkgname=python-${_name}
pkgver=3.5.0.20240928
pkgrel=1
pkgdesc="Typing stubs for paramiko."
arch=(any)
url="https://github.com/python/typeshed/tree/main/stubs/paramiko"
license=('Apache-2.0')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python>=3.8' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('79dd9b2ee510b76a3b60d8ac1f3f348c45fcecf01347ca79e14db726bbfc442d')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}


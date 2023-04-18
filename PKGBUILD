# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=python-simplepush
_name=${pkgname#python-}
pkgver=2.2.3
pkgrel=1
pkgdesc="Python library for simplepush.io"
arch=('any')
url="https://github.com/simplepush/simplepush-python"
license=('MIT')
depends=('python' 'python-requests' 'python-aiohttp' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('edf697c4fa2152a71d1ffbf1f3591e793d631d3c80f545fc622319a3af8c2c71')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}

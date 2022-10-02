# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=python-simplepush
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="Python library for simplepush.io"
arch=('any')
url="https://github.com/simplepush/simplepush-python"
license=('MIT')
depends=('python' 'python-requests' 'python-aiohttp' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0136a0305c310eb61fe1c3eb26ca343443e21e70c145a6231acd508cf087fb07')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}

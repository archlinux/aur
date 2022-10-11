# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=python-simplepush
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library for simplepush.io"
arch=('any')
url="https://github.com/simplepush/simplepush-python"
license=('MIT')
depends=('python' 'python-requests' 'python-aiohttp' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e506858771da9a221770ff3a246a242d818eb98312b9eb8d152bca7accc7096e')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}

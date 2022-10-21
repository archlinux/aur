# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=python-simplepush
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Python library for simplepush.io"
arch=('any')
url="https://github.com/simplepush/simplepush-python"
license=('MIT')
depends=('python' 'python-requests' 'python-aiohttp' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0934302843a8187977975f219e1a687ec358e966a0aba62ad8a313ee40dd63a6')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# Maintainer: Your Name <youremail@domain.com>
_name=py_vapid
pkgname=python-vapid
pkgver=1.9.4
pkgrel=1
pkgdesc="Simple VAPID header generation library"
arch=('any')
url=https://pypi.org/project/py-vapid/
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a004023560cbc54e34fc06380a0580f04ffcc788e84fb6d19e9339eeb6551a28')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

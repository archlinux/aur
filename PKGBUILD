# Maintainer: Your Name <youremail@domain.com>
_name=py_vapid
pkgname=python-vapid
pkgver=1.9.5
pkgrel=1
pkgdesc="Simple VAPID header generation library"
arch=('any')
url=https://pypi.org/project/py-vapid/
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e5653349a6fde642a4b10be5ffc641d503f77ad8591a41686f7069668f69c384')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Your Name <youremail@domain.com>
_name=pywebpush
pkgname=python-pywebpush
pkgver=2.5.0
pkgrel=3
pkgdesc="WebPush publication library"
arch=('any')
url=https://pypi.org/project/pywebpush/
license=('MIT')
depends=('python' 'python-cryptography' 'python-aiohttp' 'python-vapid' 'python-requests' 'python-http-ece')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8260f8e42d70ed95a3bd00527ffcb43b5b3df8983a4a48b059fe29b06dc3d92c')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

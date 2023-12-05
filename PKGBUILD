# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-pytest-flask
_name=pytest-flask
pkgver=1.3.0
pkgrel=1
pkgdesc="A set of pytest fixtures to test Flask applications."
arch=(any)
url='https://github.com/pytest-dev/pytest-flask'
license=(MIT)
makedepends=('python-setuptools')
depends=('python-pytest' 'python-flask' 'python-werkzeug')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('008c7f2acdc320dcab3e1745fb8e546a1f4cbdf75155db85f00bb70aea2eb3efa46d68f39fac114e3ddc3675b45d3d6d9a7bba8eb0c331c36e7f3d08c83c5da0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

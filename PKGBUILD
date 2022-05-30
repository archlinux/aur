# https://aur.archlinux.org/packages/python-types-python-dateutil
groups=('modified')

pkgname=python-types-python-dateutil
_name=${pkgname#python-}
pkgver=2.8.17
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6c54265a221681dd87f61df6743bd5eab060cf1b4086ff65c1a8fd763ed6370e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

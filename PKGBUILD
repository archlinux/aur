# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=68.2.0.2
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python' 'python-types-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('09efc380ad5c7f78e30bca1546f706469568cf26084cfab73ecf83dea1d28446')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

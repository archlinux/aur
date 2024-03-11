# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-python-dateutil
_name=${pkgname:7}
pkgver=2.8.19.20240311
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('51178227bbd4cbec35dc9adffbf59d832f20e09842d7dcb8c73b169b8780b7cb')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


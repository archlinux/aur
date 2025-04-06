# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=aiosql
pkgname=python-aiosql
pkgver=13.3
pkgrel=3
pkgdesc="Simple SQL in Python"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('22f587522426106a45683ce206cddd1357dfea65487c88ae9dbf8cb2dc138f10')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

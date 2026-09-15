# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=aiosql
pkgname=python-aiosql
pkgver=15.0
pkgrel=1
pkgdesc="Simple SQL in Python"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('744939fdfb3e0c36d88ccaf1f73cb1cf8cc38e7052666b884502db99aff8f3fd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

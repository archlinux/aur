# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=aiosql
pkgname=python-aiosql
pkgver=10.1
pkgrel=1
pkgdesc="Simple SQL in Python"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=(python-build python-installer python-wheel)
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fe6d321aca2c723b3f26cdd6e9d1f1c0845b7e073a84f2333051ad2ec80cb748')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

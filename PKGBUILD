# Contributor: cqzw555 <cqzw555@163.com>

_name=pycnite
pkgname=python-$_name
pkgver=2024.7.31
pkgrel=1
pkgdesc='Python bytecode utilities'
arch=(any)
url='https://github.com/google/pycnite.git'
license=('Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
  '47d643fcd11a1c421ffd1bf8640d3e4ff1860052488fe9aeb64be6bf0b8b367fa11387e86c4438e68ef2021fff76cadb70bdc34eebe681e8245172a05f9d8d8b'
)

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Matias

_pkgname=pgapy
pkgname=python-pgapy
pkgver=2.9
pkgrel=1
pkgdesc="Python wrapper for PGAPack, the parallel genetic algorithm library"
arch=(x86_64)
url="https://github.com/schlatterbeck/pgapy"
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f3f9a2ec444d50d4b0b48f8089fcb0d1cb25f0cfa5518275ab69bc774d91db95')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

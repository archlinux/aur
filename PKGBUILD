# Maintainer: Evert Vorster <evorster at gmail dot com>

pkgname=python-monotonic-alignment-search
_name=monotonic_alignment_search
pkgver=0.2.1
pkgrel=1
pkgdesc="Monotonically align text and speech"
arch=(x86_64)
url="https://github.com/eginhard/monotonic_alignment_search"
license=(MIT)
depends=(python python-numpy python-pytorch)
makedepends=(python-build python-installer python-wheel python-setuptools cython)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('54935e3c5cb82497e5ac81167ef20e95bf62e8b46402eb2936da5e92612b0765')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

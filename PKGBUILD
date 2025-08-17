# Maintainer: Hasan Catalgol <hasancatalgol@gmail.com>

pkgname=python-hyperscript
pkgver=0.3.0
pkgrel=1
pkgdesc="Tiny hyperscript-style HTML builder for Python (provides the hyperscript 'h' helper)"
arch=('any')
url="https://pypi.org/project/hyperscript/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/h/hyperscript/hyperscript-$pkgver.tar.gz")
sha256sums=('77e9372c09dbf0ec0e18515cd7e13a44cac7cbf800362a1eac26d9f8c4abe2a8')

build() {
  cd "hyperscript-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "hyperscript-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}

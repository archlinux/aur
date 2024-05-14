pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.5.3
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-zeroconf: Zeroconf support')
source=("https://github.com/rhasspy/wyoming/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2f24a7ee259f3c39a288e47ffc932ff58f34ed27ffd7d6660fe443df33d969a8')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

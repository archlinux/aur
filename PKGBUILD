pkgname=puny-manager
pkgver=2.2.0
pkgrel=1
pkgdesc="Minimal, local CLI password manager with encrypted vault"
arch=('any')
url="https://github.com/Vaspyyy/puny-manager"
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaspyyy/puny-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

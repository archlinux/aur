pkgname=puny-manager
pkgver=2.2.1
pkgrel=1
pkgdesc="Minimal, local CLI password manager with encrypted vault"
arch=('any')
url="https://github.com/Vaspyyy/puny-manager"
license=('MIT')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaspyyy/puny-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ce8b9099871d5a4dd96947ce7b9d605f9e1dbe551b913a1d8d97c6cf82bbf43')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

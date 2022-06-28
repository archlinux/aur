# Maintainer: Adralioh <aur at adralioh dot dev>
pkgname=ytcl
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI frontend for ytdl-server"
arch=('any')
url="https://gitlab.com/adralioh/ytcl"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cf10085c39855c7257f7c7e5d0e44fafc6edbd44eceeb0576e66f2aa7700653e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

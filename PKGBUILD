# Maintainer: Ifrit <contact@ifritnoises.org>
pkgname=screamer
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast Subnet Discovery"
arch=('any')
url="https://github.com/ifritnoises/screamer"
license=('MIT')
depends=('python' 'python-scapy' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('645861f4594bebd3dc9e3460c4778ded96458026417e289206ff5efd58a07bc7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ifrit <contact@ifritnoises.org>
pkgname=screamer
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast Subnet Discovery"
arch=('any')
url="https://github.com/ifritnoises/screamer"
license=('MIT')
depends=('python' 'python-scapy' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39526bcaad4a35bd360d87d7f6700359cbe49973c1ad29869c27e8997f776aa9')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

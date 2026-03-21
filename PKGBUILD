# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=hca-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-documenting command line client for the Human Cell Atlas API"
arch=('any')
url="https://github.com/decent-tools-for-thought/hca-cli"
license=('0BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5f3ee3c93e039893dd61851a453ae8eddef7e65b220234028f3c2d1dd07630c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

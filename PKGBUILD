# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=ensembl-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Self-documenting command line client for the Ensembl REST API"
arch=('any')
url="https://github.com/decent-tools-for-thought/ensembl-cli"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('868daec1bf99010230b3f9a4161ea1568ff495e3cd4e0a0666aaa9259e9b1fea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

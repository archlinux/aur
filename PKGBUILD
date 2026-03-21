# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=zotero-db-cli
_distname=zotero_cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Read-only CLI for querying Zotero client SQLite metadata and PDF annotation positions"
arch=('any')
url="https://github.com/decent-tools-for-thought/zotero-cli"
license=('custom:unknown')
depends=('python' 'sqlite')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_distname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_distname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

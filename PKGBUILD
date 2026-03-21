# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=semantic-scholar-cli
_distname=semantic_scholar_tool
pkgver=0.1.0
pkgrel=1
pkgdesc="Semantic Scholar CLI for Graph, Recommendations, and Datasets APIs"
arch=('any')
url="https://github.com/decent-tools-for-thought/semantic-scholar-cli"
license=('0BSD')
depends=('python')
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

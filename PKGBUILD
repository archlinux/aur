# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=semantic-scholar-cli
_pkgname=semantic-scholar-cli
_commit=3cfdef6d968df9bd926e72d1ea55a29f5eade643
pkgver=0.0.0.r5.g3cfdef6
pkgrel=1
pkgdesc="Semantic Scholar CLI for Graph, Recommendations, and Datasets APIs"
arch=('any')
url="https://github.com/decent-tools-for-thought/semantic-scholar-cli"
license=('custom:unknown')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 PROJECT_OUTLINE.md "$pkgdir/usr/share/doc/$pkgname/PROJECT_OUTLINE.md"
}

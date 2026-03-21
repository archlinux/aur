# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=pmc-cli
_distname=pmc_tool
pkgver=0.1.0
pkgrel=1
pkgdesc="Europe PMC CLI for literature and grants search"
arch=('any')
url="https://github.com/decent-tools-for-thought/pmc-cli"
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

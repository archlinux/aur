# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=pmc-cli
_distname=pmc_tool
pkgver=0.1.0
pkgrel=2
pkgdesc="Europe PMC CLI for literature and grants search"
arch=('any')
url="https://github.com/decent-tools-for-thought/pmc-cli"
license=('0BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_distname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver.tar.gz")
sha256sums=('d6727f338ea2715e994a2625c30da597820a030180267ebb680d8ec2477a2abe')

build() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

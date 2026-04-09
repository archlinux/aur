# Maintainer: Unknown <unknown@example.com>
pkgname=python-mempalace
pkgver=3.0.0
pkgrel=1
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')
depends=('python' 'python-chromadb' 'python-yaml')
provides=('mempalace')
conflicts=('mempalace')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("${pkgname:7}-$pkgver.tar.gz::https://github.com/milla-jovovich/mempalace/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36b9aa15fdbdf1e1514ff645861e983fcb0d119e105fae4a7fa73cf5ce8372e8')

build() {
  cd "${pkgname:7}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname:7}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

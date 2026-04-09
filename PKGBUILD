# Maintainer: Unknown <unknown@example.com>
pkgname=python-mempalace
pkgver=3.0.0
pkgrel=1
pkgdesc='The highest-scoring AI memory system, with 30x context compression and a temporal knowledge graph.'
arch=('any')
url='https://github.com/milla-jovovich/mempalace'
license=('MIT')
depends=('python' 'python-chromadb' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-$pkgver.tar.gz")
sha256sums=('64f7c22d0fc50e26d0cd7746325e091e041f8863182e09c47b688bde070925c6')

build() {
  cd "${pkgname:7}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname:7}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

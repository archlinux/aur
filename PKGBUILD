# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=python-anneal
_name=anneal
pkgver=0.5.0
pkgrel=1
pkgdesc="Simulated annealing and quenching techniques for Python"
arch=('x86_64')
url='https://github.com/HaoZeke/anneal'
license=('MIT')
depends=('python' 'python-numpy' 'python-array-api-compat')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-maturin' 'rust' 'cargo')
source=("https://files.pythonhosted.org/packages/source/a/anneal/anneal-${pkgver}.tar.gz")
sha256sums=('e150070da669a4dc3438fb77c32b9ecbb5c6d6c631ffa3694020dc1cc25096a7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

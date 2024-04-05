# Maintainer: Łukasz Tuz <lukasz.tuz@gmail.com> 

pkgname=python-aiohappyeyeballs
pkgver=2.3.2
pkgrel=1
pkgdesc="Python library that provides happy eyeballs algorithm for asyncio."
arch=('any')
url="https://github.com/aio-libs/aiohappyeyeballs"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/a/aiohappyeyeballs/aiohappyeyeballs-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd aiohappyeyeballs-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd aiohappyeyeballs-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

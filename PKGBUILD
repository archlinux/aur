# Maintainer: Taha Yasser Adnan <tahadnan.101@gmail.com>
pkgname=python-ttask-manager
pkgver=0.0.2
pkgrel=1
pkgdesc="A simple task management package"
arch=('any')
url="https://github.com/tahadnan/ttask-manager"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tahadnan/ttask-manager/archive/v$pkgver.tar.gz")
sha256sums=('6af57ce2543b830c0ae098b50f224a367a8835cc08fc841b1f0d466d7392d844')  # Replace with actual SHA256 sum of your source

build() {
  cd "$srcdir/ttask-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/ttask-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

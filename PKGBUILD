pkgname='termtrack'
pkgver=0.7.4
pkgrel=1
pkgdesc='Track satellites in your terminal'
arch=('any')
url='https://github.com/trehn/termtrack'
license=('GPL3')
depends=('python-click' 'python-pillow' 'python-ephem' 'python-pyshp' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("https://github.com/trehn/termtrack/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256sum if desired

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


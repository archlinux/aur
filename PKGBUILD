# Maintainer: Oliver Cabral <oliver@kym-kim.com>

pkgname=python-windborne
pkgver=1.3.2
pkgrel=1
pkgdesc="Python library and CLI for interacting with the WindBorne Data & Forecasts API"
arch=('any')
url="https://pypi.org/project/windborne/"
license=('MIT')
depends=(
	'python'
	'python-pyjwt'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/w/windborne/windborne-$pkgver.tar.gz")
sha256sums=('5980025e70165256f8df8438c4201bb8cc8c9f23d3d5582f6185ca7f2ff6d180')

build() {
  cd "$srcdir/windborne-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/windborne-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


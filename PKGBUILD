# Maintainer: Oliver Cabral <oliver@kym-kim.com>

pkgname=python-windborne
pkgver=1.4.0
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
sha256sums=('243099d16caf34bffa6196a70a899daa862362e3508df41aacd9008e73fbe9ec')

build() {
  cd "$srcdir/windborne-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/windborne-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


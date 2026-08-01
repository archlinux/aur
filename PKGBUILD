pkgname=n2
pkgver=26.39
pkgrel=1
pkgdesc="Easy, ultra-lightweight installer for Wednesware publications."
arch=('any')
url="https://wednesware.org/nitrogen"
license=('MIT')
provides=('wwn')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://pypi.org/packages/source/w/wwn/wwn-${pkgver}.tar.gz")
sha256sums=('018a9ab0230a953e8c2bbf2c1fb2d92d500380c1392c59ee84d9d416ac045a36')

build() {
    cd "wwn-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "wwn-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

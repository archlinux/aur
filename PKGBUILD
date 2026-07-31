pkgname=n2
pkgver=26.37
pkgrel=1
pkgdesc="Easy, ultra-lightweight installer for Wednesware publications."
arch=('any')
url="https://wednesware.org/nitrogen"
license=('MIT')
provides=('wwn')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://pypi.org/packages/source/w/wwn/wwn-${pkgver}.tar.gz")
sha256sums=('a21be856b76161cd5dbc8c311ebb293efd916845ffe50971a62ab24f901948cb')

build() {
    cd "wwn-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "wwn-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

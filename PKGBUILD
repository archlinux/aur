pkgname=n2
pkgver=26.38
pkgrel=1
pkgdesc="Easy, ultra-lightweight installer for Wednesware publications."
arch=('any')
url="https://wednesware.org/nitrogen"
license=('MIT')
provides=('wwn')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://pypi.org/packages/source/w/wwn/wwn-${pkgver}.tar.gz")
sha256sums=('ac41c420befb4073032c72f4fdd8dba10f1efcab626d368bac531dbe5fb6bce0')

build() {
    cd "wwn-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "wwn-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

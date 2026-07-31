pkgname=n2
pkgver=26.36
pkgrel=1
pkgdesc="Easy, ultra-lightweight installer for Wednesware publications."
arch=('any')
url="https://wednesware.org/nitrogen"
license=('MIT')
provides=('wwn')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://pypi.org/packages/source/w/wwn/wwn-${pkgver}.tar.gz")
sha256sums=('cd8580de75910fdd3525b8a71bcb4cc4398d3d709dd6cec9dcba759025f161d3')

build() {
    cd "wwn-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "wwn-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

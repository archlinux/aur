pkgname=python-pytrends
_pkgname=${pkgname:7}
pkgver=4.8.0
pkgrel=1
pkgdesc="Pseudo API for Google Trends"
url="https://github.com/dreyco676/pytrends"
license=(MIT)
arch=(any)
depends=(python python-requests python-pandas python-lxml)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('04b7b33eb6dfc120aa89cb4640688a8b633337276b6ddcea44ff0c7f6b6243d2')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

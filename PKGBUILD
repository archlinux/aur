pkgname=python-pytrends
_pkgname=${pkgname:7}
pkgver=4.9.1
pkgrel=1
pkgdesc="Pseudo API for Google Trends"
url="https://github.com/dreyco676/pytrends"
license=(MIT)
arch=(any)
depends=(python python-requests python-pandas python-lxml)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('9228055d743b00500b4670c5078c8785436a18d79082b354f7a8e57102ea82d1')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

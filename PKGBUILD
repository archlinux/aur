pkgname=python-pytrends
_pkgname=${pkgname:7}
pkgver=4.9.0
pkgrel=1
pkgdesc="Pseudo API for Google Trends"
url="https://github.com/dreyco676/pytrends"
license=(MIT)
arch=(any)
depends=(python python-requests python-pandas python-lxml)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a54fc1e3171442b3c8f5c080a5e21df807bc4faad7790cc62b7ddb059eb0a94b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

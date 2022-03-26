# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-tradingview-ta
_pkgname=tradingview_ta
pkgver=3.2.10
pkgrel=1
pkgdesc="Unofficial TradingView technical analysis API wrapper."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-colorama)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('85a11c840bce6faa869a22a79fe320df8c1d6160f8f21fba4a4c7ad850d0a538')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

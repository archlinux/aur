# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-thepassiveinvestor
_pkgname=${pkgname:7}
pkgver=1.0.10
pkgrel=1
pkgdesc="Passive Investing for the Average Joe."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-yfinance
    python-urllib3
    python-openpyxl
    python-pandas
    python-scipy
    python-requests
    python-lxml
    python-beautifulsoup4
    python-pillow
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6b325b0b9134588763c75a4d05eb2260d4111ec0cd741c27618fcb3918f0ae92')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

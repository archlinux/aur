# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finviz
_pkgname=${pkgname:7}
pkgver=1.4.6
pkgrel=1
pkgdesc="Unofficial API for FinViz.com"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-beautifulsoup4
    python-requests
    python-aiohttp
    python-urllib3
    python-user_agent
    python-cssselect
    python-tqdm
    python-tenacity
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2ce364e6fa8b5f7cb588207a5409cda6c3555b1904de9fa650e2241a65bd490b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

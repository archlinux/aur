# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finviz
_pkgname=${pkgname:7}
pkgver=1.4.5
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
sha256sums=('524a975a1d2c410d33468e63227e79f23199e303b613eb53ca9308477a743634')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

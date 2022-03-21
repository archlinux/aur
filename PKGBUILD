# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finviz
_pkgname=${pkgname:7}
pkgver=1.4.4
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
sha256sums=('9772060a070d59e8d1045ffbe826553d15f189fab43074b50bf7a510b5360172')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
